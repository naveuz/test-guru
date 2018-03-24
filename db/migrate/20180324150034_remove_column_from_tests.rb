class RemoveColumnFromTests < ActiveRecord::Migration[5.1]
  def change
    remove_column :tests, :admin_id, :string
  end
end
