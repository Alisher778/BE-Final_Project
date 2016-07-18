class AddCommentableIdAndCommentableTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :commentable_id, :integer
    add_column :posts, :commentable_type, :string
  end
end
