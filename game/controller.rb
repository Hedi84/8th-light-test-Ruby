require_relative 'game'
require_relative 'view'



class Controller

  def initialize(scores)
    @scores = scores
    @highscores = @scores.all
    @view = View.new
  end

  # USER ACTIONS

  def list
  # Display scores in the terminal (view)
  @view.display(@highscores)
  end

  def single
  # ask player for name
  player_name = @view.ask_user_for("name")
  end
end
