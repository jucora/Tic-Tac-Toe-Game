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