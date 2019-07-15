# air feels thicker than before.  Must be a horde of sludge
# use warrior.health to keep an eye on health (returns an integer representing health)
# use warrior.rest! to earn 10% of max health back.
class Player
    def play_turn(warrior)
      # need to keep track of health - max is 20
      max_health = 20
      # First choice - walk or attack
      if warrior.feel.empty?
        #if walking - check health - rest if needed
        if (warrior.health >= max_health)
          warrior.walk!
        else
          warrior.rest!
        end
      else
        warrior.attack!
      end
    end
  end