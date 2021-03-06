class User < ApplicationRecord
    has_many :scores

    validates :username, length: { in: 4..12 }
    validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "must contain no spaces or special characters"}
    validates :username, uniqueness: true

    def average_score
        unless self.scores.length == 0
            self.scores.sum {|score| score.points} / self.scores.length
        else
            0
        end
    end

    # Class Methods

    def self.top_users
        top_users = self.includes(:scores).sort_by { |user| -user.average_score}
        top_users.map {|user| {user: user, average_score: user.average_score, games_played: user.scores.length}}
    end

end
