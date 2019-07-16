# Silence.  The room feels, large, but empty.
# Luckily you have a map of this tower to help find the stairs.

# Use warrior.direction_of_stairs to determine which direction the stairs are located.
# Pass this to warrior.walk! to walk in that direction.

class Player
    def play_turn(warrior)
        warrior.walk!(warrior.direction_of_stairs)
    end
end