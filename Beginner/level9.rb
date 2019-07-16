# Time to hone your skills and apply all of the abilities you have learned.
# watch your back

class Player
    REST_HEALTH = 15
    RUN_AWAY_HEALTH = 7
    MAX_GLANCE = 4
      
    def play_turn(warrior)
        @last_known_health ||= warrior.health
        @direction ||= :forward
        feel_space = warrior.feel @direction
       
       if clear_shot? warrior
        warrior.shoot!
       elsif feel_space.empty?
        if run_away? warrior
           @direction = :backward
           warrior.walk! @direction
        elsif breather? warrior
           warrior.rest!
        else
           warrior.walk! @direction
        end
       elsif feel_space.captive?
        warrior.rescue! @direction
       elsif feel_space.wall?
        @direction = :forward
        warrior.pivot!
       else
        warrior.attack!
       end
       
       @last_known_health = warrior.health
    end
    
     
    def clear_shot? warrior
       peek = warrior.look @direction
       clicks_to_enemy = peek.index { |space| space.enemy? == true } || MAX_GLANCE
       clicks_to_captive = peek.index { |space| space.captive? == true } || MAX_GLANCE
       im_good?(warrior) && clicks_to_enemy < clicks_to_captive
    end
     
    def run_away? warrior
       bad_health = warrior.health < RUN_AWAY_HEALTH
       !im_good?(warrior) && bad_health
    end
     
    def breather? warrior
       bad_health = warrior.health < REST_HEALTH
       im_good?(warrior) && bad_health
    end
     
    def im_good? warrior
       warrior.health >= @last_known_health
    end
end
