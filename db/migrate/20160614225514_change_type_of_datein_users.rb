class ChangeTypeOfDateinUsers < ActiveRecord::Migration
  def change
    change_column :users, :date_of_birth, :datetime
  end
end
