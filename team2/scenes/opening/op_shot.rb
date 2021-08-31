module Opening
    class Op_shot < Sprite

        def update
            self.y -= 5

            if self.y <= 260
                self.y = -64
            end

        end
        
    end
end
