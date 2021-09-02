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

require_relative 'scenes/ending/director'

require_relative 'score'

Window.width = 700
Window.height = 800
Window.caption = "team2"

Scene.add(Game::Director.new, :game)
Scene.add(Opening::Director.new, :opening)
Scene.add(Ending::Director.new, :ending)
Scene.move_to(:game)

sound = Sound.new("sounds/shot_effect_01_edited.wav")

bgm = Sound.new("sounds/bgm_01.mid")
bgm.play

Window.loop do
    break if Input.key_push?(K_ESCAPE)
    Scene.move_to(:game) if Input.key_push?(K_G)
    Scene.move_to(:opening) if Input.key_push?(K_O)
    Scene.play
    if Input.key_push?(K_SPACE)
        sound.play
    end
end