class AddUserEmailAndPasswordNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:users, :email, false)
    change_column_null(:users, :password, false)
  end
end
