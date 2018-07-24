require_relative 'score'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'

csv_file   = File.join(__dir__, 'scores.csv')
scores   = Score.new(csv_file)
controller = Controller.new

router = Router.new(controller)

# Start the app
router.run
