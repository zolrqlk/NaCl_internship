# マップエディタモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director
    DEBUG_MODE = true

    # 初期化
    def initialize
      player_img =  Image.load("images/player.png")
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
    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      Enemy.init
      s = 800
      enemy_num = 3
      enemy_num.times do
        Enemy.add(0,s += -800,@enemy_img[0])
        Enemy.add(192,s,@enemy_img[1])
        Enemy.add(320,s,@enemy_img[2])
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
    end

    private

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "You are (not) cool.", @font)
    end
  end
end
