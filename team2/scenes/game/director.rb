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
      @enemy_image = Image.new(32,32,C_BLUE)
      @font = Font.new(28)
    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      @enemies = []
        100.times do
        @enemies << Enemy.new(rand(200)+200,rand(200)+200,@enemy_image)
      end
    end

    # 1フレーム描画
    def play
      title_draw
      @player.update
      @player.draw
      @enemies.each do |enemy|
        enemy.update
        enemy.draw
      end
      Sprite.check(@player,@enemies)
      @enemies.delete_if{|enemy| enemy.vanished?}
    end

    private

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "You are (not) cool.", @font)
    end
  end
end
