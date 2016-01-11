
require "bowling_game_kata.rb"

describe BowlingGameKata do

  before do
    @bowling_game = BowlingGameKata.new()
  end

  def play_rolls(number_of_rolls, amount)
    number_of_rolls.times do
      @bowling_game.roll(amount)
    end
  end

  def roll_strike()
    @bowling_game.roll(10)
  end

  def roll_spare()
    play_rolls(2,5)
  end

  it "scores a game of all 0s as 0" do
    play_rolls(20,0)
    expect(@bowling_game.score()).to eq 0
  end

  it "scores a game of all 1s as 20" do
    play_rolls(20,1)
    expect(@bowling_game.score()).to eq 20
  end

  it "scores a game of all 4s as 80" do
    play_rolls(20,4)
    expect(@bowling_game.score()).to eq 80
  end

  it "scores a game with a spare in the first frame" do
    roll_spare
    play_rolls(18,1)
    expect(@bowling_game.score()).to eq 29
  end

  it "scores a game with a strike in the first frame" do
    roll_strike
    play_rolls(18,1)
    expect(@bowling_game.score()).to eql 30
  end

  it "scores a perfect game of 300" do
    play_rolls(12,10)
    expect(@bowling_game.score()).to eql 300
  end

end
