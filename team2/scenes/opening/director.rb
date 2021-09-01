module Opening
    class Director < Sprite
        def initialize
            @player_img =  Image.load("images/player.png")
            @player_img.set_color_key(C_WHITE)

            @op_shot_img =  Image.load("images/shot.png")
            @op_not_img =  Image.load("images/enemy.png")



            @font = Font.new(56)
        end

        def reload
            Op_not.add(320, 200, @op_not_img)

        end

        #オープニング画面の要素の描画
        def play
            Window.draw_font(120, 200, "You are", @font)
            Window.draw_font(450, 200, "cool.", @font)
            Window.draw(340, 600, @player_img)


            Op_not.collection.each do |op_not|
                op_not.update
                op_not.draw
            end
        



            if Input.key_push?(K_Z)
                Op_shot.add(340, 532, @op_shot_img)
            end


            Op_shot.collection.each do |op_shot|
                if op_shot
                    op_shot.update
                    op_shot.draw
                end
    

                if op_shot
                    Sprite.check(op_shot, Op_not.collection)
                end

            end

        end
    end    
end