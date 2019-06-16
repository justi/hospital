# frozen_string_literal: true

class Bowling
  attr_reader :score

  def initialize
    @score = 0
  end

  def hit(pin_count)
    @score += pin_count
  end
end
