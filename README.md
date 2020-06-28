## Knight's Travails

This project is an exercise in data structures as part of The Odin Project's curriculum
found [here](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms)

A _Knight_ in chess can get to any other square on the board given enough moves.
The goal of this project is to write a function that, given a starting square and a destination square, returns the shortest path from start to destination, displaying each squares coordinates along the way.
This project utilizes the BFS algorithm of the previous [Binary Search Tree project](https://github.com/Tenacious-Qi/binary_search_tree).

#### Reflection

I tried a few different approaches with this project, eventually settling on a more simple approach. Prior to my last couple commits, I tried implementing a tree, but was mostly confused trying to "treat all possible moves the knight could make as children in a tree" (from the instructions). I had a hard time visualizing it that way. 

Next I tried an adacency list. I was successful getting the list to print, but unsuccessful in using it practically. Next, I tried an adjacency matrix. Again, I was successful implementing the matrix, and even managed to implement a BFS on it, but was unable to extend the BFS to find a shortest path. Finally, I made a simple hash of each chess square and all allowed Knight moves corresponding to each respective square. I then implemented a shortest path BFS algorithm to return the shortest path, iterating over the arrays (allowed moves) held in each hash key. 
