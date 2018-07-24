class View

  def display(highscores)
    counter = 0
    highscores.sort! { |a, b| b.number <=> a.number }
    highscores.each do |score|
      counter += 1
    puts "#{counter}. #{score.player_name}: #{score.number}"
  end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
