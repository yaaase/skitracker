class Grapher
  include Months

  def self.total_vertical
    sum_vertical(SkiDay.all)
  end

  def self.available_months
    by_year_and_month.each_with_object({}) do |ary, years|
      years[ary.first] = ary.last.map { |month, list| month }.sort_by { |month| MONTHS[month] }
    end
  end

  def self.monthly_vertical(month, year)
    sum_vertical(by_year_and_month[year][month])
  end

  def self.touring_chart_data
    generic_chart_data(->(collection) { sum_vertical(collection) })
  end

  def self.days_chart_data
    generic_chart_data(->(collection) { collection.count })
  end

  private

  def self.generic_chart_data(function)
    data = []
    available_months.each_pair do |year, months|
      months.each do |month|
        data << ["#{ month } #{ year }", function.call(by_year_and_month[year][month])]
      end
    end
    data
  end

  def self.by_year_and_month
    years = {}
    by_year.each_pair do |year, list|
      years[year] = by_month(list)
    end
    years
  end

  def self.by_year
    SkiDay.all.group_by { |day| day.date.year }
  end

  def self.by_month(list)
    list.group_by { |day| extract_month(day.date) }
  end

  def self.extract_month(date)
    date.to_formatted_s(:long)[/\w+/]
  end

  def self.sum_vertical(days)
    days.inject(0) { |sum, day| sum += day.vertical }
  end
end

