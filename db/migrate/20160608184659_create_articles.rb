class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :contant

      t.timestamps null: false
    end
  end
end
