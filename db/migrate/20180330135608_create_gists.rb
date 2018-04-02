class CreateGists < ActiveRecord::Migration[5.1]
  def change
    create_table :gists do |t|
      t.string :url
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
