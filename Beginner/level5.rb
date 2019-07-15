# you hear cries for help, captives must need rescuing
# use warrior.feel.captive? to see if there is a captive
# use warrior.rescue! to rescue them - do not attack captives
class Player
    def play_turn(warrior)
      max_health = 20
      @health
      
      if warrior.feel.empty?
        if warrior.health < max_health && !taking_damage?(warrior)
          warrior.rest!
        else
          warrior.walk!
        end
        if warrior.feel.captive? #determine if a captive is at this location
          warrior.rescue! #rescue captive from his chains earning 20 points in a given direction (forward by default)
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