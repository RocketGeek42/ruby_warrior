Ruby Warrior Abilities (Updated as progress through levels)

Warrior
warrior.walk!
    Move in the given direction (forward by default).

warrior.feel
    Returns a Space for the given direction (forward by default).

warrior.attack!
    Attacks a unit in a given direction (forward by default).

warrior.health
    Returns an integer representing your health.

warrior.rest!
    Gain 10% of max health back, but do nothing more.

warrior.rescue!
    Rescue a captive from his chains (earning 20 points) in a given direction (forward by default).

warrior.pivot!
    Rotate :left, :right, or :backward (default).

warrior.look
    Returns an array of up to three Spaces in the given direction (forward by default).

warrior.shoot!
    Shoot your bow and arrow in a given direction (forward by default).

Space
space.empty?
    If true, this means that nothing (except maybe stairs) is at this location and you can walk here.

space.stairs?
    Determine if stairs are at this location.

space.enemy?
    Determine if an enemy unit is at this location.

space.captive?
    Determine if a captive is at this location.

space.wall?
    Returns true if this is the edge of the level. You can't walk here.

space.ticking?
    Returns true if this space contains a bomb which will explode in time.