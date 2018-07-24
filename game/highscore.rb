
# This class creates a new score to add to the csv file
class Highscore
  attr_reader :player_name, :number

  def initialize(player_name, number)
    @player_name = player_name
    @number = number
  end
end
