# The Mars Rover Challenge

Exploring the Red Planet!

## Quick Links
* [Installation](#installation)
* [Output](#output)
* [Test Cases](#test_cases)
* [Assumptions](#assumptions)
* [The Mission Details](#mission_details)


<a name="installation"/>

## Installation

The challenge was completed in Ruby, which is all that is needed to run the application.

Simply clone the repository with the following command:

```
git clone git@github.com:jierasmus27/mars_rovers.git
```

You can run the application on the command line in the `mars_rovers` folder as per:

```
ruby run_mission.rb
```

You will be prompted to input mission related data. 

Once all rover data has been entered, please type `start` after which the entire mission will run and output the results on screen

<a name="output"/>

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

<a name="test_cases"/>

## To run test cases

Rspec was used to test the various application components. To run the tests, please install rspec into the `mars_rovers` folder:

```
gem install rspec
```
And to run the tests:
```
rspec
```
<a name="assumptions"/>

## Assumptions

Some assumptions made during development:
* The plateau on Mars is large enough that rovers can move past one another on the grid, as well as end up together in the same position.
* The input to the mission can be multi-step and does not need to be just one block of instructions, although all input is needed upfront to start the mission.
* The rover itself requires the L, R and M commands to operate.
* A rover will stop should its next move take it off the plateau, but the mission will continue.
* The mission cannot start if a rover is placed off the grid at the outset.

<a name="mission_details"/>

## The Mission Details

The problem below requires some kind of input. You are free to implement any mechanism for feeding input into your solution (for example, using hard coded data within a unit test). You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.

We highly recommend using a unit testing framework such as JUnit or NUnit. Even if you have not used it before, it is simple to learn and incredibly useful.

The code you write should be of production quality, and most importantly, it should be code you are proud of.

### Mars Rovers

A squad of robotic rovers are to be landed by NASA on a plateau on Mars.

This plateau, which is curiously rectangular, must be navigated by the rovers so that their on board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position is represented by a combination of an x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.

'M' means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

### Input

The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.

### Output

The output for each rover should be its final co-ordinates and heading.

Test Input:

5 5

1 2 N

LMLMLMLMM

3 3 E

MMRMMRMRRM

### Expected Output

1 3 N

5 1 E




