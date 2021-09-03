class Sounds
    def initialize
        @@shot_effect = Sound.new("sounds/shot_01.wav")
        @@hit_effect = Sound.new("sounds/hit_01.wav")
        @@bgm = Sound.new("sounds/game.mid")
    end

    def bgm
        @@bgm.setVolume(215)
        @@bgm.play
    end

    def self.shot_effect
        @@shot_effect.play
    end

    def self.hit_effect
        @@hit_effect.play
    end

    def self.init
        @@bgm.stop
    end
end
