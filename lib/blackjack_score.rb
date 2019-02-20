# blackjack_score.rb

$VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, "King", "Queen", "Jack"]

def blackjack_score(hand)
  score = 0
  ace = 1

  # check to make sure you get a deck between 2 and 5 cards
  if hand.length < 2 || hand.length > 5
    raise ArgumentError.new("#{hand.length} does not meet our number of cards requirement.")
  end

  hand.each do |element|
    # calculate scores for cards between 2 and 9, inclusive
    if [2..9].include?(element)
      score += element
    end
    # calculate scores for king, queen or jack
    if element == "King" || element == "Queen" || element == "Jack"
      score += 10
    end

    # calculate scores for ace when score is less than 11
    if score < 11
      # set ace to 11
      ace = 11
      score += ace
    end
    # calculate scores for ace when score is more than 11
    if score > 11
      ace = 1
      score += ace
    end
    # raise errors for invalid cards
    if !$VALID_CARDS.include?(element)
      raise ArgumentError.new("#{element} is not a valid card.")
    end
  end
  # raise errors for score above 21
  if score > 21
    raise ArgumentError.new("#{score} exceeds 21.")
  end

  return score
end

puts "#{blackjack_score([3, 4, 5])}"
puts "#{blackjack_score(["King", "Queen"])}"
