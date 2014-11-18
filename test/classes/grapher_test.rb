require 'test_helper'

class GrapherTest < ActiveSupport::TestCase
  describe 'aggregating graph data' do
    before { SkiDay.destroy_all }
    after { SkiDay.destroy_all }

    describe 'vertical' do
      before do
        @day_one = SkiDay.create(location: 'Brighton', date: Date.parse('November 12 2014'), vertical: 500)
        @day_two = SkiDay.create(location: 'Brighton', date: Date.parse('December 12 2014'), vertical: 900)
      end

      describe 'total' do
        it 'aggregates' do
          Grapher.total_vertical.must_equal 1400
        end
      end

      describe 'monthly' do
        before do
          @day_three = SkiDay.create(location: 'Brighton', date: Date.parse('13 December 2014'), vertical: 100)
        end

        it 'aggregates by month' do
          Grapher.monthly_vertical('November').must_equal 500
          Grapher.monthly_vertical('December').must_equal 1000
        end

        it 'also determines the available months' do
          Grapher.available_months.must_equal ['November', 'December']
        end
      end
    end
  end
end

