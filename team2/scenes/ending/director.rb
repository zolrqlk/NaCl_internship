# マップエディタモジュール
module Ending
    # シーン管理用ディレクタークラス
    class Director
  
      # 初期化
      def initialize
        @font1 = Font.new(64)
        @font2 = Font.new(32)
      end
  
      # Scene遷移時に自動呼出しされる規約メソッド
      def reload
        
      end
  
      # 1フレーム描画
      def play
        Window.draw_font(150, 200, "Game Over", @font1)
        str = "Score :  " + Score.point.to_s
        Window.draw_font(200, 400, str, @font2)
        Window.draw_font(200, 500, "O : Opening", @font2)
        Window.draw_font(200, 600, "G : New Game", @font2)
      end

    end
  end
  