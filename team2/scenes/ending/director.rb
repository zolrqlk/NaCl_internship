# マップエディタモジュール
module Ending
    # シーン管理用ディレクタークラス
    class Director
  
      # 初期化
      def initialize
        @font = Font.new(56)
      end
  
      # Scene遷移時に自動呼出しされる規約メソッド
      def reload
        
      end
  
      # 1フレーム描画
      def play
        Window.draw_font(120, 200, "Game Over", @font)
      end

    end
  end
  