class Task < ApplicationRecord
  belongs_to :user
  has_many :tag_lists
  has_many :tags, through: :tag_lists, dependent: :delete_all 
end
