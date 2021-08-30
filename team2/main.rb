require 'dxruby'


Window.width = 700
Window.height = 800
Window.caption = "team2"

image = Image.load("images/player.png")
image.set_color_key(C_WHITE)

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Window.draw(100, 100, image)

  end