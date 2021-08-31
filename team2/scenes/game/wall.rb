module Game
    class Wall < Sprite
        @@collection = []
        @@wall_s = []
        @@wall_a = []
        Dir::foreach("images/wall_s") do |all_img|
            next if all_img == '.' or all_img == '..'
            img = Image.load("images/wall_s/" + all_img)
            img.set_color_key(C_BLACK)
            @@wall_s << img
        end
        Dir::foreach("images/wall_a") do |all_img|
            next if all_img == '.' or all_img == '..'
            img = Image.load("images/wall_a/" + all_img)
            img.set_color_key(C_BLACK)
            @@wall_a << img
        end    

        def self.img_s
            @@wall_s
        end
        
        def self.img_a
            @@wall_a
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
            
        end

        def out
            @@collection.delete(self)
        end

        def self.init
            @@collection = []
        end
    end
end
