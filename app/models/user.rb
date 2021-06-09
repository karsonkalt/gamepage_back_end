class User < ApplicationRecord

    has_many :scores

    validates :username, length: { in: 4..12 }

end
