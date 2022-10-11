class GuessingGame
    attr_reader :num_attempts
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over= false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            @game_over = true
            puts "you win"
        end
        if num > @secret_num
            puts "too big"
        end
        if num < @secret_num
            puts "too small"
        end
    end

    def ask_user
        puts "enter a number"
        answer = gets.chomp.to_i
        check_num(answer)
    end

end
