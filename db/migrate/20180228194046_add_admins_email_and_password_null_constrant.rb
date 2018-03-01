class AddAdminsEmailAndPasswordNullConstrant < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:admins, :email, false)
    change_column_null(:admins, :password, false)
  end
end
