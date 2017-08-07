class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  # private

  def take_turn
    show_sequence
    begin
      res = require_sequence
      @game_over = true unless correct_response?(res)
    rescue
      puts 'Please enter a valid input'
      retry
    end
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def correct_response?(res)
    return false unless res.length == @sequence_length
    result = true
    @seq.each_with_index do |color, idx|
      result = false unless color.start_with?(res[idx])
    end
    result

  end

  def show_sequence
    add_random_color
    system('clear')
    @seq.each do |color|
      puts color
      sleep(2)
      system('clear')
      puts ''
      system('clear')
      sleep(1)
    end
  end

  def require_sequence
    puts 'Please enter sequence (E.g. r, b, g, y)'
    input = gets.chomp.downcase
    input.split(/\,?\s*/)
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts 'That is the correct sequence!'
  end

  def game_over_message
    puts "That is incorrect. The sequence was #{@seq.join(', ')}"
    puts 'Game over.'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $0
  Simon.new.play
end
