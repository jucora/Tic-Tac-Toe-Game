module UserInteraction
    def get_rol
        puts "\nWELCOME TO THE TIC TAC TOE GAME"
        puts "==========================="
        puts "Which player do you prefer?"
        puts "1 for X or 2 for O"
        puts "==========================="
        $rol = gets.chomp.to_i
           
    end
    def input_cell
        @cell = nil
        puts "\nSelect a number in the cell"
        @cell = gets.chomp.to_i
    end
    def again?
        puts "##################"
        puts "#PLAY AGAIN? (y/n)"
        puts "##################"
        $again = gets.chomp
        if $again == "y" || $again == "Y"
            player = Player.new
            player.validate_rol
        elsif $again == "n" || $again == "N" 
            puts "Adios Amigo!" 
            exit
        end
    end
end