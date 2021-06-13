class User < ApplicationRecord
    has_many :scores

    validates :username, length: { in: 4..12 }
    validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "must contain no spaces or special characters"}
    validates :username, uniqueness: true

    def average_score
        self.scores.sum {|score| score.points} / self.scores.count
    end

end
