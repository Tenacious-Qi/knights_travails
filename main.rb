require_relative 'binary_search_tree/main.rb'

class Board
  attr_accessor :edges

  def initialize
    @edges = edge_list
  end

  def squares
    @squares = 
    [
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

  def edge_list
    hash = {}
    squares.each do |vertex|
      x = vertex[0]
      y = vertex[1]
      hash[vertex] = find_edges(x, y)
    end
    hash
  end

  def find_edges(x, y)
    result = []
    # possible movements of Knight on x-axis and y-axis
    dx = [2, 2, -2, -2, 1, 1, -1, -1]
    dy = [1, -1, 1, -1, 2, -2, 2, -2]
    dx.count.times do |n|
      if (x + dx[n]).between?(0, 7) && (y + dy[n]).between?(0, 7)
        result << [x + dx[n], y + dy[n]]
      end
    end
    result
  end

  def find_an_edge
    edge_list.keys[0]
  end
end

class Knight
  attr_accessor :end_node, :edges

  def initialize
    @board = Board.new
    @edges = @board.edges
    @start_node = nil
    @end_node = nil
  end

  def moves(start, finish)
    puts "knight is en route from #{start} to #{finish}"
    @start_node = start
    puts "You made in x moves! Here's your path: "
    #until end_node is equal to finish, update end_node to node that has a path to finish??
    p start
    @start_node = edges[start].root
    edges.each_with_index { |edge, index| p edges[start].root }
  end
end

class Vertex
  def initialize(location, edges = nil)
    @location = location
    @edges = edges
  end
end

  # > knight_moves([3,3],[4,3])
  # => You made it in 3 moves!  Heres your path:
  #   [3,3]
  #   [4,5]
  #   [2,4]
  #   [4,3]

#---------------------with graph class----------------------#

