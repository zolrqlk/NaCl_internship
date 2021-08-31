class Director
    def initialize
        @player_img =  Image.load("images/player.png")
        @player_img.set_color_key(C_WHITE)

        @font = Font.new(56)
    end

    def reload
    end

    def play
        Window.draw_font(120, 200, "You are (not) cool.", @font)
        Window.draw(318, 600, @player_img)

        

    end
end