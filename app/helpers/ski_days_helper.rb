module SkiDaysHelper
  def number_of_ski_days
    SkiDay.count
  end

  def number_of_touring_days
    SkiDay.all.select { |day| day.vertical.positive? }.count
  end

  def total_vertical
    Grapher.total_vertical
  end

  def average_touring_vertical
    (total_vertical / number_of_touring_days.to_f).round(2)
  end

  def formatted_location(ski_day)
    ski_day.location.split(/\s/).map(&:capitalize).join(' ')
  end

  def days_by_ski
    SkiDay.all.group(:skis).count.map { |k, v| [k, v] }.sort { |a| a.last }
  end
end
