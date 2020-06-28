# frozen_string_literal: true

# uses Board#squares to create a graph of allowed Knight movements.
# uses Breadth-First Search to find the shortest path available for the Knight
class Graph
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
      vertex = path.last
      # stop loop if destination node is reached
      return path if vertex == dest

      # prevents visiting a node more than once.
      next if visited.include?(vertex)

      # iterate over each adjacent node of vertex,
      # create a new path, push it into queue
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
