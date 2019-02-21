# blackjack_score.rb

$VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, "King", "Queen", "Jack"]

def blackjack_score(hand)
  score = 0
  num_aces = 0

  # check to make sure you get a deck between 2 and 5 cards
  if hand.length < 2 || hand.length > 5
    raise ArgumentError.new("#{hand.length} does not meet our number of cards requirement.")
  end

  hand.each do |element|
    # raise errors for invalid cards
    if !($VALID_CARDS.include?(element))
      raise ArgumentError.new("#{element} is not a valid card.")
      break
    end

    if element == 1
      num_aces += 1
      next
    end

    # calculate scores for cards between 2 and 9, inclusive
    if (2..9).include?(element)
      score += element
      next
    end

    # calculate scores for king, queen or jack
    if element == "King" || element == "Queen" || element == "Jack"
      score += 10
      next
    end
  end
  # handling aces
  while num_aces > 0 && (11 + score) < 21
    score += 11
    num_aces -= 1
  end

  while num_aces > 0
    score += 1
    num_aces -= 1
  end
  # raise errors for score above 21
  if score > 21
    raise ArgumentError.new("#{score} exceeds 21.")
  end
  return score
end
