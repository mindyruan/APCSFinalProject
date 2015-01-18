APCSFinalProject
================

Pacman (with a twist).

Small circles are extra points (not mandatory to clear all).
Once you get to the big circles, you have to clear a mini-game (probably snake).

Set amount of lives (3)
Lose a life when a ghost gets you.
Don't lose a life when you lose a mini game, but the length of the snake required is set higher.

(All the while, you're avoiding the ghosts.)

As you level...
- You have to clear more mini games.
- Ghosts get faster.

January 7, 2015
- Very basic movement for pacman using with keyboard input! (currently in one direction)
- Added continuous movements for up, down, left, right using w,a,s,d (circle goes a little offscreen when you go left or down)
- Fixed it so it doesn't go offscreen but encountered a problem; circle will only move along the edge when key is pressed, but if you get away from the edge, it goes back into continuous movement
- Above problem fixed! Movement is now working perfectly.
- Trying to allow the pacman eat away circles permanently with the recording of coordinates with ArrayList<Integer>(), but this is not working yet.

January 8 night / 9, 2015
- Working on walls! Made a basic map to test getting and using colors of pixels.
- ahh yes! The circles are finally permanently eaten and put onto a blacklist. This works now.
- Scorekeeping (!!) for every circle eaten
- Needed to be debugged: when the score increases on a circle that was previously eaten already (and now black)
- Needed to be done: Put in food/circles of a specific size in the new map in order to allow pacman to eat

January 9, 2015
- As mentioned yesterday DEBUGGED: made sure the score does not increase on a circle that was previously eaten. 

January 10 night / 11, 2015
- Tried to restructure code with classes in order for Pacman and Snake to both use class movement. (still needs to be worked on)

January 11, 2015
- Started the Snake game. This is very similar to the code movement has. We might need to have the same code in both Pacman and Snake unless we figure out how to be able to incorporate Snake's code into Pacman's code.

January 12, 2015 class + night / January 13 morning
- Pacman will now stop at walls, but his sides can still clip through them (ouch). Working on fixing that problem!
- Found a bug where Pacman gets stuck when he touches a wall
- Fixed above bug, but side clipping still a problem
- Trying to debug: adding to blackList because that is that main problem.
- Found a huge bug: the indexOf fuction only finds the first instance of an object in the list, so made our own function to go through the list.

January 13, 2015
- Debugged that huge bug further. Using our created function, circles can now eat. Every time circles eat, the score increases by one and the eaten circle goes away. In Snake, another random food circle appears. In movement/Pacman, the remaining circles appear. Instead of blackLists, used the remove function and this allowed the to be eaten permanently.
- NEW FEATURE: SNAKE. Snake is eating with a tail behind it. The snake does not wrap around itself, but it moves in the direction the head is moving.
- Made a checkWalls() function that returns a boolean (true = there's a wall; false = no wall); figuring out where to put this in the movement code now!
- So down works now, Pacman stops at and doesn't clip the wall. Trying to figure out why it doesn't work with the other directions though.

January 14, 2015
- Right and down works, up and left don't even stop at the wall anymore?? Working on that now
- Combined Snake and Pacman code. Going to work on the score requirement for Snake and when we should switch between Snake/Pacman
- Snake whips around completely when the direction changes instead of wrapping around itself. This will be changed if there is time. Snake game is generally working though.
- Made an experimental map to test movement
- No more wall clipping! Neato

January 15, 2015
- Working on placing the food on the map!
- Made an experimental map to help visualize the spacing and placing of the food

January 16, 2015
- Combined our codes! Spawned food into the first row of the map, but haven't added to the other rows yet. Eating also works fine. *Food is also spawned inside the walls. We're going to manually remove those.
- Filled the map with food! (For some reason the very last box in the bottom right corner doesn't spawn a food but that's okay we'll just put the minigame there) Working on getting rid of wall food.
- Removed a few walls for the ghosts! Quite possibly the final version of the map.
- Figured out how to remove the food in the walls! Successfully removed 3 test foods; now working on removing the rest of them
- Removed all the food in the walls by manually finding each coordinate of each food (rest in peace)

January 17, 2015 (forgot to update this day, but did work)
- Created ghosts. Cannot get the ghosts to stay within the walls yet, so working on that. Made 1 ghost that chases pacman and 2 that is randomly moving.
