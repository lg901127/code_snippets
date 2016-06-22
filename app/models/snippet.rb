class Snippet < ActiveRecord::Base
  belongs_to :category
  validates :title, presence: true
  validates :work, presence: true
end
