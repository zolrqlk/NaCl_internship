module Game
    class Player < Sprite
        @@player_img = Image.load("images/player.png")
        @@player_img.set_color_key(C_WHITE)

        def self.init
            @@player = self.initialize(300, 750, @@player_img, 5)
        end

        def initialize(x,y,image,speed)
            super(x,y,image)
            @speed = speed
        end
    
        def update
            self.x += Input.x * @speed
            self.y += Input.y * @speed
            
            /プレイヤーがウィンドウからはみ出さないようにする/
            if self.x <= 0
                self.x = 0
            elsif self.x + 64 >= 700
                self.x = 636
            end
            if self.y <= 0
                self.y = 0
            elsif self.y + 64 >= 800
                self.y = 736
            end
        end
        
        def shot(obj)
            
        end

        def hit(obj)
            Scene.move_to(:ending)
        end
    end
end
