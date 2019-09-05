


module UserInteraction
    def get_rol
        puts "\nWELCOME TO THE TIC TAC TOE GAME"
        puts "Start Game"
        puts "Enter name of player 1"
        @name_1 = gets.chomp
        @rol = 1
        puts "Enter name of player 2"
        @name_2 = gets.chomp
        puts "==========================="
        puts "\n#{@name_1} VS #{@name_2}"
    end


    def input_cell
        @cell = nil
        puts "\nSelect a number in the cell"
        @cell = gets.chomp.to_i
    end


    def again?
        puts "##################"
        puts "\n#PLAY AGAIN? (y/n)"
        puts "##################"
        @again = gets.chomp
        if @again === "y" || @again === "Y"
            validate_rol
        elsif @again === "n" || @again === "N"
            puts "Adios Amigo!"
            exit
        else
            puts "Invalid option, please try again! "
            again?
        end
    end

end

