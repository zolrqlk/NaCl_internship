module Opening
    class Director < Sprite
        def initialize
            @player_img =  Image.load("images/player.png")
            @player_img.set_color_key(C_WHITE)
            @youre_img =  Image.load("images/wall_you_are.png")
            @cool_img =  Image.load("images/wall_cool.png")
            @opening_img =  Image.load("images/opening.png")

            @op_shot_img =  Image.load("images/shot.png")
            @op_not_img =  Image.load("images/enemy.png")

            @font = Font.new(56)
        end

        def reload
            Op_not.add(340, 200, @op_not_img)
            @flag = 0

        end

        #オープニング画面の要素の描画
        def play


            Window.draw(70, 200, @youre_img)
            Window.draw(465, 195, @cool_img)
            Window.draw(360, 600, @player_img)
            Window.draw(140, 700, @opening_img)

            Op_not.collection.each do |op_not|
                op_not.update
                op_not.draw
            end
        



            if Input.key_push?(K_SPACE)
                Op_shot.add(360, 532, @op_shot_img)
                Sounds.shot_effect
            end


            Op_shot.collection.each do |op_shot|
                if op_shot
                    op_shot.update
                    op_shot.draw
                end
    

                if Sprite.check(op_shot, Op_not.collection)
                    Op_not.collection.each do |op_not|
                        op_not.update
                        op_not.draw
                    end
                    @flag = 1
                end
            end

            if @flag >=1
                @flag += 1
            end

            if @flag == 60
                Scene.move_to(:game)
                Sounds.bgm
            end

        end
    end    
end