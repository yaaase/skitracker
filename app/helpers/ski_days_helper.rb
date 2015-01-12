module SkiDaysHelper
  def number_of_ski_days
    SkiDay.count
  end

  def number_of_touring_days
    SkiDay.all.select { |day| day.vertical > 0 }.count
  end

  def total_vertical
    Grapher.total_vertical
  end

  def formatted_location(ski_day)
    ski_day.location.split(/\s/).map(&:capitalize).join(' ')
  end
end

