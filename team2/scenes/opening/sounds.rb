class Sounds
    def initialize
        @@shot_effect = Sound.new("sounds/shot_effect_01_edited.wav")
        @@bgm = Sound.new("sounds/bgm_01.mid")
    end

    def self.bgm
        @@bgm.play
    end

    def self.shot_effect
        @@shot_effect.play
    end

    def self.init
        @@bgm.stop
    end
end
