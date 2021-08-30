# マップエディタモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director < DirectorBase
    DEBUG_MODE = true

    # 初期化
    def initialize
      player_img =  Image.load("images/player.png")
      @map = Map.new(50, 50, 2, 10, 20)
      @map.set_scroll_direction(1, 0)
      @player = Player.new(200, 175, player_img, @map)
      @font = Font.new(28)
      @debug_box = RenderTarget.new(32, 32, C_YELLOW)
    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      @map.reload_map_array
    end

    # 1フレーム描画
    def play
      @debug_boxes = []

      @map.update
      @map.draw
      @debug_boxes += @player.update(Input.x)
      @player.draw
      title_draw

      if DEBUG_MODE
        @debug_boxes.each do |pos|
          Window.draw(pos[0], pos[1], @debug_box)
        end
      end
    end

    private

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "Sample Game", @font)
    end
  end
end
