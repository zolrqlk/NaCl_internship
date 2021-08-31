module Game
    class Player < Sprite
        def initialize(x,y,image,speed)
            super(x,y,image)
            @speed = speed
        end
    
        def update
            self.x += Input.x * @speed
            self.y += Input.y * @speed

        def hit(obj)
            
        end
    end
end
