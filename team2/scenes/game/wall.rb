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

        def self.collection
            @@collection
        end
    
        def self.add_s
            x = rand(-100..350)
            img = @@wall_s[rand(0..@@wall_s.size - 1)]
            @@collection << self.new(x, -100, img)
            return x + img.width + 25
        end

        def self.add_a(x)
            img = @@wall_a[rand(0..@@wall_a.size - 1)]
            @@collection << self.new(x, -100, img)
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

        def self.move
            self.collection.each do |wall|
                if wall.y > 800
                  wall.out
                else
                  wall.update
                  wall.draw
                end
            end
        end
    end
end
