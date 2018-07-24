require_relative 'game'
require_relative 'view'



class Controller

  def initialize
    @scores = scores
    @highscores = @scores.all
    @view = View.new
  end

end


  # USER ACTIONS

  def list
  # Display scores in the terminal (view)
  @view.display(@highscores)
end






  def create
    # 1. Ask user for a name (view)
    name = @view.ask_user_for("name")
    # 2. Ask user for a description (view)
    description = @view.ask_user_for("description")
    # 3. Create recipe (model)
    recipe = Recipe.new(name, description)
    # 4. Store in cookbook (repo)
    @cookbook.add(recipe)
    # 5. Display
    display_tasks
  end

  def destroy
    # 1. Display recipes
    display_tasks
    # 2. Ask user for index (view)
    index = @view.ask_user_for_index
    # 3. Remove from cookbook (repo)
    @cookbook.remove(index)
    # 4. Display
    display_tasks
  end

  def search
    search_input = @view.ask_user_for("search")
    scraper = Scraper.new
    search_results = scraper.search(search_input)
    @view.display(search_results)
    # index = @view.ask_user_for_index
    # we are getting the user's choice which is an index number (-1)
    # and corresponds to number 1-5 of our results array
    recipe = search_results[@view.ask_user_for_index - 1]
    # recipe = Recipe.new(item_name, "")
    @cookbook.add(recipe)
    return list
  end

  def mark
    # 1. Display recipes
    display_tasks
    # 2. Ask user for an index (view)
    index = @view.ask_user_for_index
    # 3. Mark as done and save (repo)
    @cookbook.mark_recipe_as_done(index)
    # 4. Display recipes
    display_recipes
  end

  private

  def display_tasks
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display(recipes)
  end
end
