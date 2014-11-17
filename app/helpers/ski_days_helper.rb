module SkiDaysHelper
  def number_of_ski_days
    SkiDay.count
  end

  def total_vertical
    SkiDay.all.inject(0) { |total, day| total += day.vertical }
  end

  def formatted_location(ski_day)
    ski_day.location.split(/\s/).map(&:capitalize).join(' ')
  end
end

