class Movie < ActiveRecord::Base
  RATINGS = ['PG','PG-13','R','G']
  attr_accessible :title, :rating, :description, :release_date

  def self.ratings
    RATINGS
  end
end
