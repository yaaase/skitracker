class SkiDay < ActiveRecord::Base
  validates :location, presence: true
  validates :date, presence: true

  validates_numericality_of :vertical

  before_save do |ski_day|
    ski_day.location.downcase
    ski_day.skis.downcase
  end
end
