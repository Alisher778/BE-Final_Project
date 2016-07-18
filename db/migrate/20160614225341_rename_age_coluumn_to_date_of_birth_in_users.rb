class RenameAgeColuumnToDateOfBirthInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :age, :date_of_birth
  end
end
