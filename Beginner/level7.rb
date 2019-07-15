# feel a wall in front of you and opening behind you
# not effective at attacking backward.
# use warrior.feel.wall? and warrior.pivot! to turn around.

class Player
    def initialize()
      @health = 0
      @direction = :forward
    end

    def play_turn(warrior)
        if warrior.feel.wall?
            warrior.pivot!
        elsif (warrior.feel(@direction).empty?)
            if (should_rest? warrior)
                warrior.rest!
            elsif (should_flee? warrior)
                warrior.walk!(:backward)
            else
                warrior.walk!(@direction)
            end
        else
            warrior.attack!(@direction)
        end
        @health = warrior.health
    end

    def should_flee?(warrior)
        flee_health = 7
        poor_health = warrior.health < flee_health
        under_attack = taking_damage? warrior
        return under_attack && poor_health
    end
    
    def should_rest?(warrior)
        min_health = 15
        good_health = warrior.health > min_health
        under_attack = taking_damage? warrior
        return !(good_health || under_attack)
    end

    def taking_damage?(warrior)
        return warrior.health < @health
    end

end