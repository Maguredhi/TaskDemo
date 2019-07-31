class Tag < ApplicationRecord
  has_many :tag_lists
  has_many :tasks, through: :tag_lists, dependent: :delete_all 

end
