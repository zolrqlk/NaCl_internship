# マップエディタモジュール
module Opening
    # シーン管理用ディレクタークラス
    class Director < Sprite
        # 初期化
        def initialize
            @player_img =  Image.load("images/player.png")
            @player_img.set_color_key(C_WHITE)
            @youre_img =  Image.load("images/wall_you_are.png")
            @cool_img =  Image.load("images/wall_cool.png")
            @opening_img =  Image.load("images/opening.png")

            @op_shot_img =  Image.load("images/shot.png")
            @op_not_img =  Image.load("images/enemy.png")

            @font = Font.new(28)
        end

       # Scene遷移時に自動呼出しされる規約メソッド
        def reload
            Op_not.add(340, 200, @op_not_img)
            @flag = 0
            @shot_exist = 0
            Sounds.init
            Sounds.bgm_op
        end

        # 1フレーム描画
        def play
            Window.draw_font(10, 3, "NaCl_internship_2021_team2", @font)
            Window.draw(70, 200, @youre_img)
            Window.draw(465, 195, @cool_img)
            Window.draw(360, 600, @player_img)
            Window.draw(140, 700, @opening_img)

            Op_not.collection.each do |op_not|
                op_not.update
                op_not.draw
            end

            if @shot_exist < 1
                if Input.key_push?(K_SPACE)
                    Op_shot.add(379, 532, @op_shot_img)
                    Sounds.shot_effect
                end
            end

            Op_shot.collection.each do |op_shot|
                if op_shot
                    op_shot.update
                    op_shot.draw
                    @shot_exist = 1
                end

                if Sprite.check(op_shot, Op_not.collection)
                    Op_not.collection.each do |op_not|
                        op_not.update
                        op_not.draw
                    end
                    Sounds.hit_effect
                    @flag = 1
                end
            end

            if @flag >=1
                @flag += 1
            end

            if @flag == 30
                Scene.move_to(:game)
                Sounds.init
                Sounds.bgm_game
            end

        end
    end    
end