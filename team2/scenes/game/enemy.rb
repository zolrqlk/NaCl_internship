module Game
    class Enemy < Sprite
        @@collection = []
        @@not_img = Image.load("images/enemy.png")
        @@not_img.set_color_key(C_BLACK)

        def self.img
            @@not_img
        end
        
        def self.collection
            @@collection
        end
    
        def self.add(x, y,image)
            @@collection << self.new(x, y, image)
        end
    
        def update
            self.y += 5
        end
    
        def hit(obj)
            @@collection.delete(self)
            Score.add
        end

        def out
            @@collection.delete(self)
        end

        def self.init
            @@collection = []
        end
    end
end
