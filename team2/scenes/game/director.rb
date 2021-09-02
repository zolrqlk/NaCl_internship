# マップエディタモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director
    DEBUG_MODE = true

    # 初期化
    def initialize
      @player_img = Image.load("images/player.png")
      @player_img.set_color_key(C_WHITE)
      @not_img = Image.load("images/enemy.png")
      @not_img.set_color_key(C_BLACK)
      @shot_img = Image.load("images/shot.png")
      @shot_img.set_color_key(C_WHITE)
      wall_get
      @font = Font.new(28)
    end

    def wall_get
      @wall_s = []
      @wall_a = []
      Dir::foreach("images/wall_s") do |all_img|
        next if all_img == '.' or all_img == '..'
        img = Image.load("images/wall_s/" + all_img)
        img.set_color_key(C_BLACK)
        @wall_s << img
      end
      Dir::foreach("images/wall_a") do |all_img|
        next if all_img == '.' or all_img == '..'
        img = Image.load("images/wall_a/" + all_img)
        img.set_color_key(C_BLACK)
        @wall_a << img
      end
    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      Enemy.init
      Wall.init
      Score.init
      Shot.init
      @player = Player.new(300, 750, @player_img, 5)
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
        disp_s = @wall_s[rand(0..@wall_s.size - 1)]
        disp_a = @wall_a[rand(0..@wall_a.size - 1)]
        Wall.add(wall_x,-100,disp_s)
        Enemy.add(wall_x + disp_s.width + 25,-100,@not_img)
        Wall.add(wall_x + disp_s.width + @not_img.width + 50,-100,disp_a)
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
