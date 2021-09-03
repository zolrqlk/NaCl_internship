class Sounds
    @@shot_effect = Sound.new("sounds/shot_01.wav")
    @@hit_effect = Sound.new("sounds/hit_01.wav")
    @@bgm_game = Sound.new("sounds/game.mid")
    @@bgm_op = Sound.new("sounds/opening.mid")

    def self.bgm_game
        @@bgm_game.setVolume(215)
        @@bgm_game.play
    end

    def self.bgm_op
        @@bgm_op.play
    end

    def self.shot_effect
        @@shot_effect.play
    end

    def self.hit_effect
        @@hit_effect.play
    end

    def self.init
        @@bgm_game.stop
        @@bgm_op.stop
    end
end
