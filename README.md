# The Mars Rover Challenge

The challenge was completed in Ruby, which is all that is needed to run the application.

## To Install

Simply clone the repository with the following command:

```
git clone git@github.com:jierasmus27/mars_rovers.git
```

You can run the application which takes in the coordinates and rover instructions on the command line as per:

```
ruby run_mission.rb
```

You will be prompted to input mission related data. 

Once all rover data has been entered, please type `start` after which the entire mission will run and output the results on screen

## Output

The application will output the final location and orientation of the rovers on the grid as per the input format.
```
1 1 E
2 3 W
```
It will also output any error messages received in the course of the mission, should the rover be placed on an invalid position or moved off the plateau.

Lastly it will also display a grid of the plateau, with the rover's final orientation displayed. If more than one rover ended up in the same place, it will show the number of rovers up to 9 - and for 10 or more, just display that there were many on the grid position with an asterisk `*`.
```
 - - - - - - - - - - E
 - - - - - - - - - - -
 - - - - - - - - - - -
 - - - - - - - - - - -
 - * - - - - - - - - -
 - - - - - N - - - - -
 - - - - - - - - - - -
 - - - - - - - - 3 - -
 - - - - - - - - - - -
 - - - - - - - - - - -
 - - - - - - - - - - -
 ```


### Example usage and output

![image](https://user-images.githubusercontent.com/2363917/155939923-650ecbb1-4ad0-4730-abc1-b50e58479f1a.png)

## To run test cases

Rspec was used to test the various application components. To verify there, please install rspec into the folder:

```
gem install rspec
```
And to run the tests:
```
rspec
```

## Assumptions made

Some assumptions made during development:
* The plateau on Mars is large enough that rovers can move past one another on the grid, as well as end up together in the same position.
* The input to the mission can be multi-step and does not need to be just one block of instructions, although all input is needed upfront to start the mission.
* The rover itself requires the L, R and M commands to operate.
* A rover will stop should its next move take it off the plateau, but the mission will continue.
* The mission cannot start if a rover is placed off the grid at the outset.





