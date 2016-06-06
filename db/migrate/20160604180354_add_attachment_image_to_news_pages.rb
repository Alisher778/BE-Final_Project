class AddAttachmentImageToNewsPages < ActiveRecord::Migration
  def self.up
    change_table :news_pages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :news_pages, :image
  end
end
