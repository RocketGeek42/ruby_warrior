# Hear mumbling of wizards. Beware of their deadly wands!  Good thing you found a bow.
# Use warrior.look to determine surroundings, and warrior.shoot! to fire an arrow.

class Player

    def play_turn(warrior)
        if look_foward(warrior) == "captive"
            if (warrior.feel.captive?)
                warrior.rescue!
            else
                warrior.walk!
            end
        elsif look_foward(warrior) == "enemy"
            warrior.shoot!
        else
            warrior.walk!
        end
    end

    def look_foward(warrior)
        if (warrior.look.any? { |square| square.captive?})
            return "captive"
        elsif (warrior.look.any? { |square| square.enemy?})
            return "enemy"
        end
    end

end