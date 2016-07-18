class RemovePostIdFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :post_id, :integer
    remove_column :posts, :commentable_id, :integer
    remove_column  :posts, :commentable_type, :string
  end
end
