class AddCountTimeToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :duration, :integer
  end
end
