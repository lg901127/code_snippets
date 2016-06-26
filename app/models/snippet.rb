class Snippet < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :title, presence: true
  validates :work, presence: true
end
