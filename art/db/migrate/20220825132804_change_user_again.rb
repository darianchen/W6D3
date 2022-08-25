class ChangeUserAgain < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :username, :string, index: { unique: true }
  end
end
