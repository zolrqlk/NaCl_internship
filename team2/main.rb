require 'dxruby'

require_relative 'scene'
require_relative 'scenes/game/director'
require_relative 'scenes/game/enemy'
require_relative 'scenes/game/player'
require_relative 'scenes/game/score'

require_relative 'scenes/opening/director'

Window.width = 700
Window.height = 800
Window.caption = "team2"

Scene.add(Game::Director.new, :game)
Scene.add(Director.new, :opening)
Scene.move_to(:opening)

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.move_to(:game) if Input.key_push?(K_G)
    Scene.move_to(:opening) if Input.key_push?(K_O)
    Scene.play

  end