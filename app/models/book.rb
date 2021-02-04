class Book < ApplicationRecord
    validates :title, presence: true
    validates :author, presence: true
    validates :genre, presence: true
    validates :price, presence: true, numericality: {greater_than_or_equal_to: 0, message: " must be a positive numeric value"}
    validates :published_date, presence: true
end
