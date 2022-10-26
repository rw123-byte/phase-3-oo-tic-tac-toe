require "pry"

class TicTacToe

    WIN_COMBINATIONS = [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]]


    def initialize()
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board

        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end

    def input_to_index(str)

        int = str.to_i

        int = int - 1

        return int

    end

    def move(int,sym)

        @board[int] = sym
        @board[int] = sym
    end

    def position_taken?(idx)

        if @board[idx] == " "
            return false
        else
            return true
        end
    end

    def valid_move?(idx)

        if position_taken?(idx) || idx > 8 || idx <0
            return false
        else
            return true
        end

    end

    def turn_count

        counter = 0
        @board.each do |space|

            if space == "X" or space == "O"
                counter += 1
            end
        end

        return counter
    end

    def current_player
        x_counter = 0
        o_counter = 0

        @board.each do |space|
        
            if space == "X"

                x_counter += 1

            elsif space == "O"

                o_counter += 1
            end
        end

        if x_counter == o_counter

            return "X"
        end

        return "O"

    end

    def turn

        value = gets

        idx = self.input_to_index(value)
        v_move = self.valid_move?(idx)
        c_player = self.current_player

        if v_move
            @board[idx] = c_player
           return display_board
        
        else 
            self.turn

        end

    end

    def won?

        WIN_COMBINATIONS.each do |combo|

            if @board[combo[0]] == @board[combo[1]] &&  @board[combo[1]] == @board[combo[2]] && @board[combo[2]] != " "

                return combo
            end
        end

        return false

    end

    def full?

        @board.each do |space|

            if space == " "
                return false
            end

        end
                        
         if self.won? == false
            return true

         end
    end

    def draw?
       
       if self.won? == false && self.full? == true
            return true
       end

       return false        

    end

    def over?

        if self.won? || self.draw? == true
            return true
        end

        return false

    end

    def winner

        pp @board

        if self.won? != false
            player = ""

            if self.current_player == "O"

                player = "X"
            else 
                player = "O"

            end

            return player

        else 
            return nil

        end        

    end

    def play

        self.turn
        
        pp self.over?


        if self.over? != true

            return self.play
        end


        if self.winner != nil
            return print "congratulates the winner #{self.winner}"

        end

        return print "Cat's Game!"

    end
end

binding.pry