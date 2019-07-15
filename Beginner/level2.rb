# It is too dark to see anything, but you smell sludge nearby.
# Use warrior.feel.empty? to see if there is anything in front of you
# warrior.feel returns a space for the given direction (Forward by default)
# Use warrior.attack! to fight it.
# warrior.attack! attacks a unit in a given direction (forward by default)
# one action (ending in !) per turn.
class Player
    def play_turn(warrior)
        # Need to make a decision, if space ahead is emtpy, walk otherwise attack
        if warrior.feel.empty? #if true this means that nothing (except stairs) is at this locationand you can walk here
            warrior.walk!
        else
            warrior.attack!
        end
    end
end