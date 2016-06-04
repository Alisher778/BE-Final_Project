class CreateNewsPages < ActiveRecord::Migration
  def change
    create_table :news_pages do |t|
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
