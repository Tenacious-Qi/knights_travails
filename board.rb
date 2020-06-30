# frozen_string_literal: true

# maps the chess board
class Board
  attr_accessor :squares

  def initialize
    @squares = make_board
  end

  def make_board
    board = []
    x = 0
    8.times do
      y = 0
      8.times do |n|
        board << [x, y + n]
      end
      x += 1
    end
    board
  end
end
