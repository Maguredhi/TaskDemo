class Task < ApplicationRecord
  belongs_to :user
  has_many :tag_lists
  has_many :tags, through: :tag_lists, dependent: :destroy

  default_scope { order(created_at: :desc)}
end