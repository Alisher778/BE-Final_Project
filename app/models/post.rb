class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 75 }, uniqueness: true
  validates :text, presence: true, length: { minimum: 15, maximum: 350 }, uniqueness: true
  validates :user, presence: true
  belongs_to :user
end
