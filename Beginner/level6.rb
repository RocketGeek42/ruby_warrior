# wall behind you feels a bit further away
# hear more cries for help
# walk backward by passing :backward as an argument to walk!
# same goes for feel, rescue! and attack!
# archers have limmited attack distance

class Player
    def initialize()
      @health = 0
      @captives_saved = 0
    end  
  
    def play_turn(warrior)
      @direction = (@captives_saved == 0) ? :backward : :forward
      if (warrior.feel(@direction).empty?)
        if (should_rest? warrior)
          warrior.rest!
        elsif (should_flee? warrior)
          warrior.walk!(:backward)
        else
          warrior.walk!(@direction)
        end
      else
        if warrior.feel(@direction).captive?
          warrior.rescue!(@direction)
          @captives_saved += 1
        else
          warrior.attack!(@direction)
        end
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