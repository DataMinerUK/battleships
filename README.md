# More advanced OO with games: Battle Ships


Battleships (or Battleship) is a game where each player has a board upon which they can place a number of ships. The boards are 10x10 two dimensional grid.

<img src="https://github.com/makersacademy/course/blob/master/images/battleships.jpg" width="500px" height="500px">

After each player has placed their ships on their own board they take turns to shoot on the opponent's board. In each round, each player takes a turn to announce a target square in the opponent's grid which is to be shot at. The opponent announces whether or not the square is occupied by a ship, and if it is a _hit_, they mark this on their own primary grid. The attacking player notes the hit or miss on their own _tracking_ grid, in order to build up a picture of the opponent's fleet.

When all of one player's ships have been sunk the game finishes and the player who has ships remaining is the winner.

Implementation
==============

Implemented using MVP-style iteration. Followed this (MVP pill)[https://github.com/makersacademy/course/blob/master/pills/mvp.md] up to 'Scooter' version and then implemented the rest of the functionality as it only required setting the size and orientation of a ship, making sure a ship cannot be placed outside of the board or on another ship and ensuring a player cannot receive a strike in the same location.

This implementation *does not use a grid*. Our "board" is an array containing ships and it knows its outer right and botom boundaries. Thus, a representation of 2D space is given solely by a set of coordinates. The x coordinate is a letter and the y coordinate a number e.g. C4. The "board" has a default size of 10 ("boards" are set to be square). The outer right edge is defined by the last letter coordinate (for a "board" of dimension 10 this is J) and the outer bottom edge is defined by the last number coordinate (for a "board" of dimension 10 this is 9). To check if a ship is outside the dimensions of our "board" we check the last position of the ship (logic dictates that if the last position is outside of the boundaries then the ship is off the "board" and if any other earlier part is off the "board" then so is the last position) has a coordinate letter following the outer right boundary, in this case J, or it has a coordinate number following the outer bottom boundary, in this case 9. Thus a grid need never be made. I found this implementation much more elegant. In refactoring (an implementation with a grid)[https://github.com/kfcrobbie/battleships_new] I found this grid-less logic resulted in less functional dependency on the Board class and allowed for much simpler method implementation.

Domain Model
============

Ship
----

* Instances are given a starting point, a size and an orientation (:horizontal or :vertical)
* On initialization it is given a status of :floating, a hit count of 0 and an array with all the coordinates the ship occupies
* eg `<Ship:0x007fdfa4037a88 @starting_point="C4", @size=4, @orientation=:horizontal, @position=["C4", "D4", "E4", "F4"], @status=:floating, @hits=0> `
* The class was further extended using a ship creating module to instantiate boats (size 2), destroyers (size 3), submarines (size 3), battleships (size 4) and aircraft carriers (size 5)
* A ship can receive a hit which results in its hit count incrementing by 1 and its status changed to :sunk if the hit count equals its size

Board
-----

* Instances have a default dimension of 10
* On initialization it is given an empty board array
* Eg `<Board:0x007fdfa401ebf0 @dimension=10, @board=[]> `
* It places a ship in the array as long as it is not outside the board and there is no ship already at any of its positions
* It can strike a coordinate such that, if there is a ship present it calls the ships hit method and returns "HIT!" if not it returns "MISS!"
* It can test if all the ships in the board array are sunk

Player
------

* Instances are asked for an argument which should be a Board object
* On initialization it is given an empty array for hits and an empty array for misses
* Eg `<Player:0x007fdfa2838180 @board=#<Board:0x007fdfa2838220 @dimension=10, @board=[]>, @hits=[], @misses=[]>`
* It can place a ship using the board place method
* It can check if it has lost by calling the board all_ships_sunk? method
* It can receive a strike at a coordinate, checking to see if that coordinate has already been logged in its arrays and if not it uses the boards strike method to either hit a ship and record the coordinate in its hits array or record it in its misses array

Play in IRB
===========

```ruby
2.0.0-p247 :008 > boat = Ship.boat "C4",:horizontal
 => #<Ship:0x007fdfa3873e00 @starting_point="C4", @size=2, @orientation=:horizontal, @position=["C4", "D4"], @status=:floating, @hits=0>
2.0.0-p247 :009 > destroyer = Ship.destroyer "J9",:vertical
 => #<Ship:0x007fdfa3869c48 @starting_point="J9", @size=3, @orientation=:vertical, @position=["J9", "J10", "J11"], @status=:floating, @hits=0>
2.0.0-p247 :010 > submarine = Ship.submarine "G3",:vertical
 => #<Ship:0x007fdfa2843620 @starting_point="G3", @size=3, @orientation=:vertical, @position=["G3", "G4", "G5"], @status=:floating, @hits=0>
2.0.0-p247 :012 > aircraft_carrier = Ship.aircraft_carrier "E4",:horizontal
 => #<Ship:0x007fdfa2822ad8 @starting_point="E4", @size=5, @orientation=:horizontal, @position=["E4", "F4", "G4", "H4", "I4"], @status=:floating, @hits=0>
2.0.0-p247 :013 > board = Board.new
 => #<Board:0x007fdfa30953f0 @dimension=10, @board=[]>
2.0.0-p247 :014 > player = Player.new board
 => #<Player:0x007fdfa307cf08 @board=#<Board:0x007fdfa30953f0 @dimension=10, @board=[]>, @hits=[], @misses=[]>
2.0.0-p247 :015 > player.place boat
2.0.0-p247 :016 > player.place destroyer
RuntimeError: ship is outside the board ...
2.0.0-p247 :017 > player.place submarine
2.0.0-p247 :018 > player.place aircraft_carrier
RuntimeError: there is a ship already there! ...
2.0.0-p247 :019 > player.receive_strike "D4"
 => "HIT!"
2.0.0-p247 :020 > player.receive_strike "F7"
 => "MISS!"
2.0.0-p247 :021 > player.hits
 => ["D4"]
2.0.0-p247 :022 > player.misses
 => ["F7"]
2.0.0-p247 :023 > player.receive_strike "D4"
RuntimeError: you have already shot here ...
2.0.0-p247 :024 > player.lost?
 => false
2.0.0-p247 :025 > board
 => #<Board:0x007fdfa30953f0 @dimension=10, @board=[#<Ship:0x007fdfa3873e00 @starting_point="C4", @size=2, @orientation=:horizontal, @position=["C4", "D4"], @status=:floating, @hits=1>, #<Ship:0x007fdfa2843620 @starting_point="G3", @size=3, @orientation=:vertical, @position=["G3", "G4", "G5"], @status=:floating, @hits=0>]>
```
Now let's say we hit all the remaining coordinates where there is a ship

```ruby
2.0.0-p247 :029 > player
 => #<Player:0x007fdfa307cf08 @board=#<Board:0x007fdfa30953f0 @dimension=10, @board=[#<Ship:0x007fdfa3873e00 @starting_point="C4", @size=2, @orientation=:horizontal, @position=["C4", "D4"], @status=:sunk, @hits=2>, #<Ship:0x007fdfa2843620 @starting_point="G3", @size=3, @orientation=:vertical, @position=["G3", "G4", "G5"], @status=:sunk, @hits=3>]>, @hits=["D4", "C4", "G3", "G4", "G5"], @misses=["F7"]>
2.0.0-p247 :030 > player.lost?
 => true
```
