require 'dxruby'

require_relative 'scene'
require_relative 'scenes/game/director'
require_relative 'scenes/game/enemy'
require_relative 'scenes/game/player'
require_relative 'scenes/game/shot'
require_relative 'scenes/game/wall'
require_relative 'scenes/game/sounds'

require_relative 'scenes/opening/director'
require_relative 'scenes/opening/op_object'
require_relative 'scenes/opening/sounds'

require_relative 'scenes/ending/director'

require_relative 'score'

Window.width = 700
Window.height = 800
Window.caption = "You are (not) cool - team2"

Scene.add(Game::Director.new, :game)
Scene.add(Opening::Director.new, :opening)
Scene.add(Ending::Director.new, :ending)
Scene.move_to(:opening)

sound = Sounds.new()

Window.loop do
    f = 1
    break if Input.key_push?(K_ESCAPE)
    if f == 1 && Input.key_push?(K_G)
        Scene.move_to(:game)
        sound.bgm
        f = 0
    end
    if f == 1 && Input.key_push?(K_O)
        Scene.move_to(:opening)
        sound.bgm.stop
    end
    Scene.play
end