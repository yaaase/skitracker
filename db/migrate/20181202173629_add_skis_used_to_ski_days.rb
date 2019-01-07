class AddSkisUsedToSkiDays < ActiveRecord::Migration[5.2]
  def change
    add_column :ski_days, :skis, :string
  end
end
