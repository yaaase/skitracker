class Grapher
  def self.total_vertical
    sum_vertical(SkiDay.all)
  end

  def self.available_months
    by_month.keys
  end

  def self.monthly_vertical(month)
    sum_vertical(by_month[month])
  end

  private

  def self.by_month
    SkiDay.all.group_by { |day| extract_month(day.date) }
  end

  def self.extract_month(date)
    date.to_formatted_s(:long)[/\w+/]
  end

  def self.sum_vertical(days)
    days.inject(0) { |sum, day| sum += day.vertical }
  end
end

