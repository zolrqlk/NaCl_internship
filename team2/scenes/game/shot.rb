module Game
    class Shot < Sprite

        @@collection = []

        @@shot_img = Image.load("images/shot.png")
        @@shot_img.set_color_key(C_WHITE)
    
        def self.img
            @@shot_img
        end
        
        def self.collection
            @@collection
        end
    
        def self.push(x, y,image)
            @@collection << self.new(x + 19, y, image)
        end
    
        def update
            self.y -= 10
        end
    
        def hit(obj)
            @@collection.delete(self)
        end

        def shot(obj)
            @@collection.delete(self)
        end

        def out
            @@collection.delete(self)
        end

        def self.init
            @@collection = []
        end

        def self.move
            self.collection.each do |shot|
                if shot
                  if shot.y < -100
                    shot.out
                  else
                    shot.update
                    shot.draw
                  end          
                end
            end
        end
    end
end
