# frozen_string_literal: true

# initializes a new graph with allowed moves mapped to a hash (Graph#make_graph)
# has one method that calls Graph#find_shortest_path
# with parameters for start and end square.
class Knight
  attr_reader :graph

  def initialize(graph = Graph.new)
    @graph = graph
  end

  def moves(source, dest)
    return warn 'Move not allowed!' unless allowed_move?(source, dest)

    result = graph.find_shortest_path(source, dest)
    puts "You made it in #{result.count - 1} moves! Here's your path:"
    result.each { |square| p square }
  end

  def allowed_move?(source, dest)
    source.max <= 7 && dest.max <= 7 && source.min >= 0 && dest.min >= 0
  end
end
