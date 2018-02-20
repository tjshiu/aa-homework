class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
    @current_player_name = @name1
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |i|
      unless i == 6 || i == 13
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    valid = %w(0 1 2 3 4 5 7 8 9 10 11 12)
    if valid.include?(start_pos) && @cup[start_pos] != []
      true
    else
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    new_pos = start_pos
    @cups[start_pos].each do |stone|
      new_pos += 1
      new_pos = 0 if new_pos > 13
      if new_pos == 7 && @current_player_name == @name2
        new_pos += 1
      elsif new_pos == 13 && @current_player_name == @name1
        new_pos = 0
      end
      @cups[new_pos] << stone
    end

    @cups[start_pos] = []
    render
    next_turn(new_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 7
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
