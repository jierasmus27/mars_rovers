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

Once completed, please type `stop` after which the entire mission will run and output the results on screen

## To run test cases

Rspec was used to test the various application components. To verify there, please install rspec into the folder:

```
gem install rspec
```
And to run the tests:
```
rspec
```
## Output

The application will output the final location and orientation of the rovers on the grid as per the input format.
```
1 1 E
2 3 W
```
It will also output any error messages received in the course of the operations, should the rover be placed or moved off the plateau.

Lastly it will also display a grid of the plateau, with the rover's final orientation displayed. If more than one rover ended up in the same place, it will show the number of rovers - or just display that there were many on the grid position.

### Example usage and output

![image](https://user-images.githubusercontent.com/2363917/155901184-920438e3-52a4-49f8-9c3a-46b7335f8e2b.png)




