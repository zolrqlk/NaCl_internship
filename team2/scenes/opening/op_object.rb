module Opening
    class Op_shot < Sprite

        @@collection = []

        def self.collection
            @@collection
        end

        def self.add(x, y,image)
            @@collection << self.new(x, y, image)
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

        
    end

    class Op_not < Sprite
        @@collection = []
    
        def self.collection
            @@collection
        end
    
        def self.add(x, y,image)
            @@collection << self.new(x, y, image)
        end

        def hit(obj)
            @@collection.delete(self)
        end

    
        def update
        end
    
    end
end
