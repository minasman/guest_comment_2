class Guest < ApplicationRecord
    has_many :comments
    has_many :stores, through: :comments
end
