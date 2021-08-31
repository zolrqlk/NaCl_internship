class Director
    def initialize
        @font = Font.new(24)
    end

    def reload
    end

    def play
        Window.draw_font(100, 100, "You are (not) cool.")
    end
end