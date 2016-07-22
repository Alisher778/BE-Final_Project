class AddUserIdToPosts < ActiveRecord::Migration
  def change
    t.references :user, index: true
    add_foreign_key :posts, :users
  end
end
