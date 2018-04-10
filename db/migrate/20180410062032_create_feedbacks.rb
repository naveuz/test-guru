class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id

      t.timestamps
    end

    add_index :feedbacks, :user_id
  end
end
