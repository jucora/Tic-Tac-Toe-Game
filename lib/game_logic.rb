require_relative '../bin/main'
include UserInteraction
#====================================================================
# This is the class Player and is called every time a new game starts
#====================================================================
class Player
    public
    def validate_rol
        get_rol
        if @rol === 1 || @rol === 2
            board = Board.new ["1","2","3","4","5","6","7","8","9"], @rol, @name_1, @name_2
            board.print_board
            
        else
            puts "\n\n\nNumber #{@rol} is not a valid option"
            validate_rol
        end
    end
end



#===============================================================================================================================================
# This is the class Rules. This class contains all rules of the game, so everytime a player plays, this class will verify if movements are valid
# This class also checks if there is a winner or in case the game ends it will puts Game Over
#===============================================================================================================================================

class Rules < Player
    def winner?
        #Horizontal Test
        
        if @board[0] === @draw && @board[1] === @draw && @board[2] === @draw
            @board[0] = "-" 
            @board[1] = "-" 
            @board[2] = "-"
            print_last
            puts "\nPlayer #{@name} Wins"
            again?
        elsif @board[3] === @draw && @board[4] === @draw && @board[5] === @draw
            @board[3] = "-" 
            @board[4] = "-" 
            @board[5] = "-"
            print_last
            puts "\nPlayer #{@name} Wins"
            again?
        elsif @board[6] === @draw && @board[7] === @draw && @board[8] === @draw
            @board[6] = "-" 
            @board[7] = "-" 
            @board[8] = "-"
            print_last
            puts "\nPlayer #{@name} Wins"
            again?
        end
        
        #Vertical Test
        
        if @board[0] === @draw && @board[3] === @draw && @board[6] === @draw
            @board[0] = "|" 
            @board[3] = "|" 
            @board[6] = "|"
            print_last
            puts "\nPlayer #{@name} Wins"
            again?
        elsif @board[1] === @draw && @board[4] === @draw && @board[7] === @draw
            @board[1] = "|" 
            @board[4] = "|" 
            @board[7] = "|"
            print_last
            puts "\nPlayer #{@name} Wins"
            again?
        elsif @board[2] === @draw && @board[5] === @draw && @board[8] === @draw
            @board[2] = "|" 
            @board[5] = "|" 
            @board[8] = "|"
            print_last
            puts "\nPlayer #{@name} Wins"
            again?
        end
        
        #Diagonal 1 Test
        
        if @board[0] === @draw && @board[4] === @draw && @board[8] === @draw
            @board[0] = "\\" 
            @board[4] = "\\" 
            @board[8] = "\\"
            print_last
            puts "\nPlayer #{@name} Wins"
            again?
        end
        
        #Diagonal 2 Test
        
        if @board[2] === @draw && @board[4] === @draw && @board[6] === @draw
            @board[2] = "/" 
            @board[4] = "/" 
            @board[6] = "/"
            print_last
            puts "\nPlayer #{@name} Wins"
            answer = again?
            if answer === true
                validate_rol 
            end
        end
        
    end
    
    def game_over?
        empty = 0
        @board.each do |cell| 
             if cell === "X" || cell === "O" 
                 empty += 1 
             end
        end
        if empty == 9
            puts "\nGAME OVER, NO WINNERS THIS TIME"
            print_last
            again?
        end
        
        if @rol === 2 
            @rol = 1
            @name = @name_1
        else
            @rol =2
            @name = @name_2
        end
        print_board
        input_cell
    end
    
    def valid_move? 
    if @rol == 1
        @draw = "X"
    else
        @draw = "O"
    end
    if @board[@cell-1] == "X" || @board[@cell-1] == "O"
        puts "\n\n\n\n\n\n¡¡¡¡¡¡¡¡THE CELL IS ALREADY TAKEN!!!!!!!!"
        print_board
    else
        case @cell
            when 1
                @board[0] = @draw
            when 2
                @board[1] = @draw
            when 3
                @board[2] = @draw
            when 4
                @board[3] = @draw
            when 5
                @board[4] = @draw
            when 6
                @board[5] = @draw
            when 7
                @board[6] = @draw
            when 8
                @board[7] = @draw
            when 9
                @board[8] = @draw
            else
                puts "Invalid Option, please try again!"
                input_cell
        end
        winner?
        game_over?
    end
    
    end  
end
