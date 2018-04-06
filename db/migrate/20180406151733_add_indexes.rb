class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, :author_id
    add_index :questions, :test_id
    add_index :gists, :question_id
    add_index :gists, :user_id
    add_index :answers, :question_id
  end
end
