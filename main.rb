# frozen_string_literal: true

require 'set'
# maps the chess board
class Board
  attr_accessor :squares

  def initialize
    @squares = [
      [0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
      [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7],
      [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7],
      [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7],
      [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7],
      [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7],
      [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7],
      [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7],
    ]
  end
end

# initializes a new graph with allowed moves mapped to a hash (Graph#make_graph)
# has one method that calls Graph#find_shortest_path
# with parameters for start and end square.
class Knight
  def initialize
    @graph = Graph.new
  end

  def moves(source, dest)
    return 'move not allowed' unless allowed_move?(source, dest)

    result = @graph.find_shortest_path(source, dest)
    puts "You made it in #{result.count - 1} moves! Here's your path:"
    result.each { |square| p square }
  end

  def allowed_move?(source, dest)
    source.max <= 7 && dest.max <= 7 && source.min >= 0 && dest.min >= 0
  end
end

# uses Board#squares to create a graph of allowed Knight movements.
# uses Breadth-First Search to find the shortest path available for the Knight
class Graph
  attr_accessor :graph

  def initialize
    @board = Board.new
    @graph = make_graph
  end

  # creates a hash with squares as keys and allowed moves as values
  def make_graph
    hash = {}
    @board.squares.each do |square|
      x = square[0]
      y = square[1]
      hash[square] = adj_squares(x, y)
    end
    hash
  end

  # finds possible moves
  def adj_squares(x_ax, y_ax)
    squares = []
    dx = [2, 2, -2, -2, 1, 1, -1, -1]
    dy = [1, -1, 1, -1, 2, -2, 2, -2]
    dx.count.times do |n|
      if (x_ax + dx[n]).between?(0, 7) && (y_ax + dy[n]).between?(0, 7)
        squares << [x_ax + dx[n], y_ax + dy[n]]
      end
    end
    squares
  end

  # uses breadth first search to find the most direct route to destination
  def find_shortest_path(source, dest, graph = @graph)
    queue = [[source]]
    visited = Set.new

    until queue.empty?
      # path starts with source. then will be first node in new_path
      path = queue.shift
      # set vertex to last node in path
      vertex = path[-1]
      # stop loop if destination node is reached
      return path if vertex == dest

      # prevents visiting a node more than once.
      next if visited.include?(vertex)

      # iterate over each adjacent node, create a new path, push it into queue
      graph[vertex].each do |curr_node|
        new_path = Array.new(path)
        new_path << curr_node
        # stop loop if current node matches destination
        return new_path if curr_node == dest

        queue << new_path
      end
      visited << vertex
    end
  end
end
