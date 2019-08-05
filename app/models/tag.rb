class Tag < ApplicationRecord
  has_many :tag_lists
  has_many :tasks, through: :tag_lists, dependent: :destroy

end
