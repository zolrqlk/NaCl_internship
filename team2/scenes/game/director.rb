# マップエディタモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director
    DEBUG_MODE = true

    # 初期化
    def initialize
      player_img = Image.load("images/player.png")
      player_img.set_color_key(C_WHITE)
      @player = Player.new(200, 175, player_img, 3)
      enemy_img_base = Image.load("images/wall.png")
      enemy_img_base.set_color_key(C_BLACK)
      not_img = Image.load("images/enemy.png")
      not_img.set_color_key(C_BLACK)
      @enemy_img = []
      @enemy_img[0] = enemy_img_base.slice(0,0,192,64)
      @enemy_img[1] = not_img
      @enemy_img[2] = enemy_img_base.slice(192,0,128,64)

      @font = Font.new(28)
      
      @shot_img = Image.load("images/shot.png")
      @shot_img.set_color_key(C_WHITE)

    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      Enemy.init
      Wall.init
      s = 800
      enemy_num = 3
      enemy_num.times do
        Wall.add(0,s += -800,@enemy_img[0])
        Enemy.add(192,s,@enemy_img[1])
        Wall.add(320,s,@enemy_img[2])
      end
    end

    # 1フレーム描画
    def play
      title_draw
      @player.update
      @player.draw

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
        Shot.push(@player.x, @player.y - @shot_img.width, @shot_img)
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
    end

    private

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "You are (not) cool.", @font)
    end
  end
end
