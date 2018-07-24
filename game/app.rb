require_relative 'scores'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'

csv_file   = File.join(__dir__, 'scores.csv')
scores   = Scores.new(csv_file)
controller = Controller.new(scores)

router = Router.new(controller)

# Start the app
router.run
