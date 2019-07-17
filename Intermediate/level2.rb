# Another large room, but with several enemies blocking your way to the stairs.
# Just like walking, you can attack! and feel in multiple directions (:forward, :left, :right, :backward).

class Player

    def initialize()
        @health = 0
    end

    def play_turn(warrior)
        if warrior.feel(warrior.direction_of_stairs).empty?
            if (need_rest? warrior)
                warrior.rest!
            elsif (should_run? warrior)
                warrior.walk!(:backward)
            else
                warrior.walk!(warrior.direction_of_stairs)
            end
        else
            warrior.attack!(warrior.direction_of_stairs)
        end
        @health = warrior.health
    end

    def should_run?(warrior)
        run_health = 7
        poor_health = warrior.health < run_health
        under_attack = taking_damage? warrior
        return under_attack && poor_health
    end

    def need_rest?(warrior)
        min_health = 15
        good_health = warrior.health > min_health
        under_attack = taking_damage? warrior
        return !(good_health || under_attack)
    end

    def taking_damage?(warrior)
        return warrior.health < @health
    end
end

# one emeny left on game area
