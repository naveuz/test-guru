class AddColumnToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :author_id, :string
  end
end
