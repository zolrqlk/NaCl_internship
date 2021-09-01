module Game
    class Shot < Sprite

        @@collection = []
    
        def self.collection
            @@collection
        end
    
        def self.push(x, y,image)
            @@collection << self.new(x, y, image)
        end
    
        def update
            self.y -= 3
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
    end
end
