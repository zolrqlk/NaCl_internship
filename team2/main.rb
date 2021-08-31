require 'dxruby'

require_relative 'scene'
require_relative 'scenes/game/director'
require_relative 'scenes/game/enemy'
require_relative 'scenes/game/player'
require_relative 'scenes/game/shot'
require_relative 'scenes/game/score'
require_relative 'scenes/game/wall'

require_relative 'scenes/opening/director'

require_relative 'scenes/ending/director'

Window.width = 700
Window.height = 800
Window.caption = "team2"

Scene.add(Game::Director.new, :game)
Scene.add(Opening::Director.new, :opening)
Scene.add(Ending::Director.new, :ending)
Scene.move_to(:game)

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.move_to(:game) if Input.key_push?(K_G)
    Scene.move_to(:opening) if Input.key_push?(K_O)
    Scene.move_to(:ending) if Input.key_push?(K_E)
    Scene.play
end