APCSFinalProject
================

Pacman (with a twist).

Small circles are extra points (not mandatory to clear all).
Once you get to the big circles in the four corners, you have to clear a mini-game of Snake. You have to clear all minigames to win. 

Set amount of lives (3)
Lose a life when a ghost gets you.
Lose a life when you lose Snake minigame (Either ghost gets you or you hit the border)

When you lose a life, you also go back to the center of the Pacman map.

(All the while, you're avoiding the ghosts.)

Ghosts are in both Snake and Pacman.

In Pacman...
- The ghosts patrol the minigames in the four corners, so the ghosts will be roaming around the sides of the game.
[We couldn't really code the ghosts so that they keep within the walls and follow Pacman (even if we did, the ghosts would spaz and get out of control sometimes)]

In Snake...
- The ghosts follow Snake.

Only one level.

***removed this{
As you level... 
- You have to clear more mini games.
- Ghosts get faster.
 }


WHAT TO PULL
-------------
- Only the base folder and these files: 
  - base.pde
  - catgod.gif
  - try2.png
- All other folders/files are just experimentations and are not necessary.


LOG
-------------
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

January 17, 2015
- Removed a few walls for the ghosts! Quite possibly the final version of the map.
- Figured out how to remove the food in the walls! Successfully removed 3 test foods; now working on removing the rest of them
- Removed all the food in the walls by manually finding each coordinate of each food (rest in peace)
- Created ghosts. Cannot get the ghosts to stay within the walls yet, so working on that. Made 1 ghost that chases pacman and 2 that is randomly moving.  (forgot to update this day, but did work)
- Put mini games on the map. Pacman is brought to the middle and Snake begins. Working on bringing Pacman back onto the same spot on the map after a game of Snake.
- Pacman will now go back to where he was before on the map after player beats Snake.

January 18, 2015
- Continued with ghosts. Sometimes, they stay within the walls, and sometimes, they don't. Need to make ghosts chase after pacman in a way that the ghosts will not start spazzing.
- Continued working on the whipping of the tail of Snake. Almost there...hopefully.

January 19, 2015
- CHANGES TO THE GAME: 
  - Ghosts in the pacman game will patrol the corners (where the minigames are)
  - Ghosts will now also be in the Snake minigame
- Made the corner ghosts mentioned above. Right now, Pacman can go through them; to be fixed soon.
- SNAKE wraps around itself and no longer whips around. (Thanks to classmates who gave a few hints)
- Pacman will be sent back to the middle if eaten by the corner ghosts.
- Made a ghost in Snake that will be jiggling around randomly and also following pacman.
- Made sure collisions with the ghosts or the walls in Snake will make the user lose a life. Then, the Snake game will end and go back to Pacman.
- Minigame circles will now reappear if the player loses the minigame.
- Added lives counter and win/lose screens
