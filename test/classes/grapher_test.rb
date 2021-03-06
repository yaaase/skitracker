require 'test_helper'

class GrapherTest < ActiveSupport::TestCase
  describe 'aggregating graph data' do
    before { SkiDay.destroy_all }
    after  { SkiDay.destroy_all }

    describe 'vertical' do
      before do
        @day_one = SkiDay.create(location: 'Brighton',
                                 date: Date.parse('November 12 2014'),
                                 vertical: 500)
        @day_two = SkiDay.create(location: 'Brighton',
                                 date: Date.parse('December 12 2014'),
                                 vertical: 900)
      end

      describe 'total' do
        it 'aggregates' do
          Grapher.total_vertical.must_equal 1400
        end
      end

      describe 'yearly' do
        before do
          @day_three = SkiDay.create(location: 'Brighton',
                                     date: Date.parse('13 January 2015'),
                                     vertical: 100)
        end

        it 'groups by year and then month' do
          Grapher.available_months.must_equal(
            2014 => %w[November December],
            2015 => %w[January]
          )
        end
      end

      describe 'monthly' do
        before do
          @day_three = SkiDay.create(location: 'Brighton',
                                     date: Date.parse('13 December 2014'),
                                     vertical: 100)
        end

        it 'aggregates by month' do
          Grapher.monthly_vertical('November', 2014).must_equal 500
          Grapher.monthly_vertical('December', 2014).must_equal 1000
        end

        it 'also determines the available months' do
          Grapher.available_months[2014].must_equal %w[November December]
        end

        it 'sorts months in case they are out of order in the given data' do
          @day_four = SkiDay.create(location: 'Brighton',
                                    date: Date.parse('14 October 2014'),
                                    vertical: 1000)
          Grapher.available_months[2014].must_equal %w[October November December]
        end

        describe 'charts' do
          before do
            @day_four = SkiDay.create(location: 'Brighton',
                                      date: Date.parse('13 January 2015'),
                                      vertical: 100)
            @day_four = SkiDay.create(location: 'Brighton',
                                      date: Date.parse('19 January 2015'),
                                      vertical: 100)
            @day_five = SkiDay.create(location: 'Brighton',
                                      date: Date.parse('14 October 2014'),
                                      vertical: 1000)
          end

          describe 'touring chart data' do
            it 'provides, finally, a list of month+year, num-of-days, vertical' do
              Grapher.touring_chart_data.must_equal([
                                                      ['October 2014', 1000],
                                                      ['November 2014', 500],
                                                      ['December 2014', 1000],
                                                      ['January 2015', 200]
                                                    ])
            end
          end

          describe 'days chart data' do
            it 'provides a list of month+year and number of days' do
              Grapher.days_chart_data.must_equal([
                                                   ['October 2014', 1],
                                                   ['November 2014', 1],
                                                   ['December 2014', 2],
                                                   ['January 2015', 2]
                                                 ])
            end
          end
        end
      end
    end
  end
end
