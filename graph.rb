
class Board
  attr_accessor :squares
  
  def initialize
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
end

# node
class Vertex
  attr_accessor :data, :next_node

  def initialize(data, next_node)
    @data = data
    @next_node = next_node
  end
end

class Knight
  def initialize(start = nil, destination = nil)
    @start = start
    @dest = dest
  end
end

# represents a list of adjacency lists
# an entry at graph[i] = list of vertices adjacent to the ith index
# e.g. graph[0] would point to nodes containing
class Graph
  attr_accessor :vertices

  def initialize(vertices)
    @board = Board.new
    @V = vertices
    @graph = Array.new(@V) { nil }
    @vertices = @graph
  end

  def edge_list
    result = []
    @board.squares.each do |square|
      x = square[0]
      y = square[1]
      result << find_edges(x, y)
    end
    result
  end

  def find_edges(x, y)
    result = []
    # possible movements of Knight on x-axis and y-axis
    dx = [2, 2, -2, -2, 1, 1, -1, -1]
    dy = [1, -1, 1, -1, 2, -2, 2, -2]
    dx.count.times do |n|
      if (x + dx[n]).between?(0, 7) && (y + dy[n]).between?(0, 7)
        result << @board.squares.find_index([x + dx[n], y + dy[n]])
      end
    end
    result
  end

  def add_edge(src, dest)
    # Adding the node to the source node 
    node = Vertex.new(dest, @graph[src])
    @graph[src] = node
    # Adding the source node to the destination, 
    # since it's an undirected graph 
    # node = Vertex.new(src, @graph[dest])
    # @graph[dest] = node
  end

  def add_edges
    64.times do |n|
      src = n
      dest = edge_list[n].each{ |item| add_edge(src, item)}
    end 
  end

  def print_graph
    @V.times do |i|
      puts
      print "Valid moves at square #{i} \nhead -> "
      temp = @graph[i]
      while temp
        print "#{temp.vertex},"
        temp = temp.next_node
      end
      puts
    end
  end
end
