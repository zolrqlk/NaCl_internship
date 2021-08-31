module Game
    class Player < Sprite
        @@player_img = Image.load("images/player.png")
        @@player_img.set_color_key(C_WHITE)

        def initialize
            super
            self.x = 300
            self.y = 750
            self.image = @@player_img
            @speed = 5
        end

        def self.x
            @player.x
        end

        def self.y
            @player.y
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

        def self.init
            @player = self.new
        end

        def self.move
            @player.update
            @player.draw
        end

        def self.body
            @player
        end
    end
end
