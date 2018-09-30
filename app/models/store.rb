class Store < ApplicationRecord
    has_many :comments
    has_many :guest, through: :comments
end
