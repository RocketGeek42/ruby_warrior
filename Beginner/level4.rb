# can hear a bow being stretched
# no new abilities
# do not rest while taking damage
# save @health instance variable and compare it on eatch turn to see if you are taking damage
class Player
    def play_turn(warrior)
        max_health = 20
        @health
        
        if warrior.feel.empty? #If space ahead is empty
            if warrior.health < max_health && !taking_damage?(warrior) #if warrior health is less than max and not taking damage
                warrior.rest!
            else
                warrior.walk!
            end
        else
        warrior.attack!
        end
        @health = warrior.health
    end
    def taking_damage?(warrior)
        warrior.health < @health
    end
end  
