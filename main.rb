# frozen_string_literal: true

require 'set'
require_relative 'knight.rb'
require_relative 'graph.rb'
require_relative 'board.rb'

knight = Knight.new

puts "Test 1: \n\n"
p knight.moves([0, 0], [1, 2]) # => [[0, 0], [1, 2]]
puts

puts "Test 2: \n\n"
p knight.moves([0, 0],[3, 3]) # => [[0, 0], [2, 1], [3, 3]]
puts

puts "Test 3: \n\n"
p knight.moves([3, 3], [0, 0]) # => [[3, 3], [1, 2], [0, 0]]
puts

puts "Test 4: \n\n"
p knight.moves([7, 0], [0, 7]) # => [[7, 0], [5, 1], [7, 2], [5, 3], [3, 4], [1, 5], [0, 7]]
puts
