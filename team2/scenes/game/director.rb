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
      
      @font = Font.new(28)
    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      enemy_img = Image.load("images/wall.png")
      enemy_img.set_color_key(C_BLACK)
      @enemy = Enemy.new(0,0,enemy_img)
    end

    # 1フレーム描画
    def play
      title_draw
      @player.update
      @player.draw
      @enemy.update
      @enemy.draw
      Sprite.check(@player,@enemy)
      #@enemy.delete_if{@enemy.vanished?}
    end

    private

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "You are (not) cool.", @font)
    end
  end
end
