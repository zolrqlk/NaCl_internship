require 'dxruby'

require_relative 'scene'
require_relative 'scenes/game/director'
require_relative 'scenes/game/enemy'
require_relative 'scenes/game/player'
require_relative 'scenes/game/score'

Window.width = 700
Window.height = 800
Window.caption = "team2"

Scene.add(Game::Director.new, :game)
Scene.move_to(:game)

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.play

  end