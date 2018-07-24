require_relative 'game'
require 'csv'
require_relative 'highscore'

class Scores
  def initialize(csv_file)
    @csv_file = csv_file
    @scores = []
    load_csv
  end

  def all
    return @scores
  end

  def add(score)
    @scores << score
    save_to_csv
  end


  private

   def load_csv
    CSV.foreach(@csv_file) do |row|
      @scores << Highscore.new(row[0], row[1])
    end
  end

  def save_to_csv
   CSV.open(@csv_file_path, 'wb') do |csv|
      @scores.each do |score|
        csv << []
      end
    end
  end
end
