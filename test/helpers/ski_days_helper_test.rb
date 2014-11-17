require 'test_helper'

class SkiDaysHelperTest < ActionView::TestCase
  describe 'SkiDaysHelper' do
    before do
      @module = Object.new.extend(SkiDaysHelper)
    end

    describe 'formatted_location' do
      it 'capitalizes each word' do
        ski_day = SkiDay.new(location: 'guardsman pass')
        @module.formatted_location(ski_day).must_equal 'Guardsman Pass'
      end
    end
  end
end

