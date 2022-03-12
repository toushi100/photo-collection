class Photo < ApplicationRecord
    has_one :user
    has_one :venue
end
