class User < ApplicationRecord
    has_many :scores

    validates :username, length: { in: 4..12 }

    def average_score
        self.scores.sum {|score| score.points} / self.scores.count
    end

end
