class Article < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description

  default_scoped  { order(created_at: :desc) }

  belongs_to :user
end
