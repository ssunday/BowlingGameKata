require "bowling_game_kata"

describe BowlingGameKata do

  before do
    @bowling_game_kata = BowlingGameKata.new
  end

  def play_rounds(number_of_rounds, roll_amount)
    number_of_rounds.times do
      @bowling_game_kata.roll(roll_amount)
    end
  end

  context "Scoring" do

    context "a game of all 0s" do

      before do
        play_rounds(20,0)
      end

      it "#score returns 0" do
        expect(@bowling_game_kata.score).to eq 0
      end

    end

    context "a game of all 1s" do
      before do
        play_rounds(20,1)
      end

      it "#score returns 20" do
        expect(@bowling_game_kata.score).to eq 20
      end

    end

    context "a game of one spare" do

      before do
        play_rounds(2,5)
        play_rounds(18,1)
      end

      it "#score returns 29" do
        expect(@bowling_game_kata.score).to eq 29
      end

    end

    context "a game of one strike" do

      before do
        play_rounds(1,10)
        play_rounds(18,1)
      end

      it "#score returns 30" do
        expect(@bowling_game_kata.score).to eq 30
      end

    end


    context "a perfect game" do

      before do
        play_rounds(12,10)
      end

      it "#score returns 300" do
        expect(@bowling_game_kata.score).to eq 300
      end
    end

  end
end
