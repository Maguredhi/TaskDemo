class Tag < ApplicationRecord
  has_many :tag_lists
  has_many :task, through: :tag_lists, dependent: :delete_all 

end
