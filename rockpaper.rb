VALID_CHOICES = %w(rock paper scissors lizard spock)
ABBREV_CHOICES = %w(r p sc l sp)

def prompt(message)
  puts("=> #{message}")
end

def convert_to_word(abbreviation)
  case abbreviation
  when "r" then "rock"
  when "p" then "paper"
  when "sc" then "scissors"
  when "l" then "lizard"
  when "sp" then "spock"
  end
end

def win?(first, second)
  (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'rock' && (second == 'lizard' || second == 'scissors')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_score(player, computer)
  prompt("The score is You: #{player} Computer: #{computer}.")
end

loop do
  player_score = 0
  computer_score = 0
  loop do
    choice = ''
    loop do
      prompt("Choose one: (R)ock (P)aper (SC)issors (L)izard (SP)ock")
      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(choice)
        break
      elsif ABBREV_CHOICES.include?(choice)
        choice = convert_to_word(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice} and computer chose #{computer_choice}.")
    display_result(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end
    display_score(player_score, computer_score)

    if player_score == 5
      prompt("Game over, you win!")
      break
    elsif computer_score == 5
      prompt("Game over, computer wins!")
      break
    end
  end

  prompt("Do you want to play again? Y for yes.")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for playing!")
