class Score < Sprite
    @@score = 0

    def self.point
        @@score
    end

    def self.add
        @@score += 1
    end

    def self.init
        @@score = 0
    end
end