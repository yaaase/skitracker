class AddDateToSkiDay < ActiveRecord::Migration
  def change
    add_column :ski_days, :date, :date
  end
end
