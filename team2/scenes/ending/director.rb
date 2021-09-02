# マップエディタモジュール
module Ending
    # シーン管理用ディレクタークラス
    class Director
  
      # 初期化
      def initialize
        @font1 = Font.new(64)
        @font2 = Font.new(32)
        @gameover_img =  Image.load("images/gameover.png")
        @admire_img =  Image.load("images/admire.png")
      end
  
      # Scene遷移時に自動呼出しされる規約メソッド
      def reload
        
      end
  
      # 1フレーム描画
      def play
        Window.draw(220, 100, @gameover_img)
        Window.draw(30, 200, @admire_img)
        str = "Score :  " + Score.point.to_s
        Window.draw_font(200, 400, str, @font1)
        Window.draw_font(270, 550, "O : Reset", @font2)
        Window.draw_font(270, 600, "G : Try again", @font2)
        Window.draw_font(400, 700, "sound:MaouDamashii", @font2)
        Window.draw_font(400, 750, "bgm:Cyber-Rainforce", @font2)

      end
    end
  end
  