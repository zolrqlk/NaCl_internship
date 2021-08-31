# マップエディタモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director
    DEBUG_MODE = true

    # 初期化
    def initialize
      @font = Font.new(28)
    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      Enemy.init
      Wall.init
      Score.init
      Shot.init
      Player.init
      @flag = 0
      @flag_max = 100
    end

    # 1フレーム描画
    def play
      title_draw
      @player.update
      @player.draw
      @flag += 1

      if @flag == @flag_max
        wall_x = rand(-100..350)
        disp_s = Wall.img_s[rand(0..Wall.img_s.size - 1)]
        disp_a = Wall.img_a[rand(0..Wall.img_a.size - 1)]
        Wall.add(wall_x,-100,disp_s)
        Enemy.add(wall_x + disp_s.width + 25,-100,Enemy.img)
        Wall.add(wall_x + disp_s.width + Enemy.img.width + 50,-100,disp_a)
        @flag = 0
        @flag_max -= 1
      end
      if @flag > 110
        p 'error'
      end

      Wall.collection.each do |wall|
        if wall.y > 800
          wall.out
        else
          wall.update
          wall.draw
        end
      end

      Enemy.collection.each do |enemy|
        if enemy.y > 800
          enemy.out
        else
          enemy.update
          enemy.draw
        end
      end
      #enemyとwallがプレイヤーに当たったときの判定(プレイヤーが消える)
      Sprite.check(Enemy.collection,@player)
      Sprite.check(Wall.collection,@player)

      #p Enemy.collection.size

      if Input.key_push?(K_SPACE)
        Shot.push(@player.x, @player.y - Shot.img.width, Shot.img)
      end
      Shot.collection.each do |shot|
        if shot
          if shot.y < -100
            shot.out
          else
            shot.update
            shot.draw
          end
          #弾がenemy(not)に当たったらどっちも消える
          Sprite.check(shot,Enemy.collection)
          #弾がwallに当たったら弾だけ消える
          Sprite.check(shot,Wall.collection)
        end
      end
      score_draw
    end

    private

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "You are (not) cool.", @font)
    end

    def score_draw
      Window.draw_font(650, 5, Score.point.to_s, @font)
    end
  end
end
