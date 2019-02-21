require "minitest"
require "minitest/spec"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/pride"

require_relative "../lib/blackjack_score"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Blackjac Score" do
  it "can calculate the score for a pair of number cards" do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it "facecards have values calculated correctly" do
    # Arrange
    hand_one = ["King", 2]
    hand_two = ["Queen", 2]
    hand_three = ["Jack", 2]

    # Act
    score_one = blackjack_score(hand_one)
    score_two = blackjack_score(hand_two)
    score_three = blackjack_score(hand_three)

    # Assert
    expect(score_one).must_equal 12
    expect(score_two).must_equal 12
    expect(score_three).must_equal 12
  end

  it "calculates aces as 11 where it does not go over 21" do
    # Arrange
    hand = [1, 3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 18
  end

  it "calculates aces as 1, if an 11 would cause the score to go over 21" do
    # Arrange
    hand = ["King", 1, 4]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 15
  end

  it "raises an ArgumentError for invalid cards" do
    # Assert
    expect { blackjack_score(["King", 3, "J"]) }.must_raise ArgumentError
  end

  it "raises an ArgumentError for more than 5 cards in the hand" do
    # Assert
    expect { blackjack_score([4, 8, 1, 9, "King", "Queen"]) }.must_raise ArgumentError
  end
end
