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
      @enemy_img = Image.load("images/enemy.png")
      @enemy_img.set_color_key(C_BLACK)
      @font = Font.new(28)

      @shot_img = Image.load("images/player.png")
      @shot_img.set_color_key(C_WHITE)

    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      s = 800
      enemy_num = 3
      enemy_num.times do
        Enemy.add(0,s += -800,@enemy_img)
      end
    end

    # 1フレーム描画
    def play
      title_draw
      @player.update
      @player.draw
      Enemy.collection.each do |enemy|
        if enemy.y > 800
          enemy.out
        else
          enemy.update
          enemy.draw
        end
      end
      Sprite.check(@player,Enemy.collection)
      Enemy.collection.delete_if{|enemy| enemy.vanished?}
      #p Enemy.collection.size
      @enemy.update
      @enemy.draw
      if Input.key_push?(K_SPACE)
        @shot = Shot.new(@player.x, @player.y - @shot_img.width, @shot_img)
      end
      if @shot
        @shot.update
        @shot.draw
      end
    end

    private

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "You are (not) cool.", @font)
    end
  end
end
