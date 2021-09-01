module Opening
    class Director
        def initialize
            @player_img =  Image.load("images/player.png")
            @player_img.set_color_key(C_WHITE)

            @op_shot_img =  Image.load("images/player.png")
            @player_img.set_color_key(C_WHITE)


            @font = Font.new(56)
        end

        def reload
        end

        #オープニング画面の要素の描画
        def play
            Window.draw_font(120, 200, "You are", @font)

            Window.draw_font(450, 200, "cool.", @font)

            Window.draw_font(320, 200, "(not)", @font)
            Window.draw(340, 600, @player_img)


            if Input.key_push?(K_Z)
                @op_shot = Op_shot.new(318, 532, @op_shot_img)
            end

            if @op_shot
                @op_shot.update
                @op_shot.draw
            end
                    
        end
    end
end