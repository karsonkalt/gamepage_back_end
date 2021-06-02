class User < ApplicationRecord
    include Player

    has_many :scores

    
end
