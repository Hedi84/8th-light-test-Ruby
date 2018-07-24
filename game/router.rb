class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to tic tac toe!"
    puts "           --           "

    while @running
      display_options
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.start_game
    when 3 then @controller.destroy
    when 4 then @controller.search
    when 5 then @controller.mark
    when 6 then stop
    else
      puts "Please press 1, 2, 3, 4, or 5"
    end
  end

  def stop
    @running = false
  end

  def display_options
    puts ""
    puts "What would you like to do?"
    puts "1 - See high scores"
    puts "2 - Start a single-player game"
    puts "3 - Start a multi-player game"
    puts "4 - Watch the computer play"
    puts "5 - Stop and exit"
  end
end
