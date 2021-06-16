class Score < ApplicationRecord
  belongs_to :user
  validates :points, presence: true

end
