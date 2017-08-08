require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups[0,6] = Array.new(6){[:stone] * 4}
    @cups[7,6] = Array.new(6){[:stone] * 4}
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless (1..12) === start_pos
  end

  def make_move(start_pos, current_player_name)
    start_pos -= 1 if [1..6].include?(start_pos)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    side = current_player_name == @name1 ? 1 : 2
    until stones.empty?
      i = i.next % 14
      redo if (side * 7 + 6) % 14 == i

      @cups[i] << stones.pop
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if [6, 13].include?(ending_cup_idx)
      return :prompt
    elsif @cups[ending_cup_idx].size == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
    p @cups
  end

  def one_side_empty?
    side1 = @cups[0,6]
    side2 = @cups[7,6]
    side1.all?(&:empty?) || side2.all?(&:empty?)
  end

  def winner
    case @cups[6].size <=> @cups[13].size
    when 1 then @name1
    when -1 then @name2
    when 0 then :draw
    end
  end
end
