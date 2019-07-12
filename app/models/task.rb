class Task < ApplicationRecord
  belongs_to :user
  has_many :tag_lists
  has_many :tag, through: :tag_lists, dependent: :delete_all 
end
