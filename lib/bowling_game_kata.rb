class BowlingGameKata
  attr_reader :rolls
  def initialize()
    @rolls = []
  end

  def roll(number_of_pins)
    @rolls << number_of_pins
  end

  def score()
    frame = 0
    roll_index = 0
    total_score = 0
    while (frame < 10)
      if (spare?(roll_index))
        total_score += 10
        total_score += spare_bonus(roll_index)
        roll_index += 2
      elsif strike?(roll_index)
        total_score += 10
        total_score += strike_bonus(roll_index)
        roll_index += 1
      else
        total_score += sum_of_frame(roll_index)
        roll_index += 2
      end
      frame += 1
    end
    total_score
  end

  private

  def sum_of_frame(roll_index)
    rolls[roll_index] + rolls[roll_index+1]
  end

  def spare?(roll_index)
    rolls[roll_index] + rolls[roll_index+1] == 10
  end

  def spare_bonus(roll_index)
    return rolls[roll_index+2]
  end

  def strike?(roll_index)
    rolls[roll_index] == 10
  end

  def strike_bonus(roll_index)
    rolls[roll_index+1] + rolls[roll_index+2]
  end

end
