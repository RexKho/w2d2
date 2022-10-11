class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample()
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end


  def get_matching_indices(char)
    newarr = []
    @secret_word.each_char.with_index do |ele, idx|
      if char == ele
        newarr << idx
      end
    end
    return newarr
  end

  def fill_indices(char, arr)
    arr.each do |where|
      @guess_word[where] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    end
    if get_matching_indices(char).length == 0
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, get_matching_indices(char))
    end
    @attempted_chars << char
    return true
  end

    def ask_user_for_guess
      puts "Enter a char:"
      answer = gets.chomp
      try_guess(answer)
    end

    def win?
      if @guess_word.join("") == @secret_word
        puts "WIN"
        return true
      else
        return false
      end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        puts "LOSE"
        return true
      else
        return false
      end
    end

    def game_over?
      if win? || lose?
        puts @secret_word
        return true
      else 
        return false
      end
    end
end
