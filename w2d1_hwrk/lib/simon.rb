class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @game_over = false
    @sequence_length = 1
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    puts "START"
    add_random_color
    seq.each do |color|
      puts "#{color}"
      sleep(1)
      puts "Next!"
      sleep .75
      system('clear')
      sleep .75
    end
  end

  def require_sequence
    system('clear')
    puts "Please input the colors with the next color on a new line"
    index = 0
    until index == sequence_length
      input = gets.chomp.downcase
      if seq[index] != input
        @game_over = true
        break
      end
      index += 1
    end
  end

  def add_random_color
    random_color = COLORS.sample
    seq << random_color
  end

  def round_success_message
    system('clear')
    puts "CORRECT!!! next round!"
    sleep(1)
  end

  def game_over_message
    puts "Sorry! Game Over!"
    sequence = @seq.join(" ")
    puts "This is the sequence: #{sequence}. You made it #{sequence_length - 1} rounds"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []

    puts "Play again? yes or no?"
    input = gets.chomp.downcase
    if input == 'yes'
      self.play
    else
      exit
    end
  end
end

s = Simon.new
s.play
