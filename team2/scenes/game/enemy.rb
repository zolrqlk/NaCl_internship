module Game
    class Enemy < Sprite
        @@collection = []
        @@not_img = Image.load("images/enemy.png")
        @@not_img.set_color_key(C_BLACK)
        
        def self.collection
            @@collection
        end
    
        def self.add(x)
            @@collection << self.new(x, -100, @@not_img)
            return x + @@not_img.width + 25
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

        def self.move
            self.collection.each do |enemy|
                if enemy.y > 800
                  enemy.out
                else
                  enemy.update
                  enemy.draw
                end
            end
        end
    end
end
