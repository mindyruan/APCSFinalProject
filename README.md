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

January 12, 2015
- Pacman will now stop at walls, but his sides can still clip through them (ouch). Working on fixing that problem!
- Found a bug where Pacman gets stuck when he touches a wall
- Fixed above bug, but side clipping still a problem
