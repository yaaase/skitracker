class CreateSkiDays < ActiveRecord::Migration
  def change
    create_table :ski_days do |t|
      t.string :location
      t.integer :vertical

      t.timestamps
    end
  end
end
