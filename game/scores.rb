require_relative 'game'
require 'csv'

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

  def remove(index)
    @score = @scores.delete_at(index)
    save_to_csv
  end


  private

   def load_csv
    CSV.foreach(@csv_file) do |row|
      @scores << Score.new(row[0], row[1], row[2], row[3])
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
