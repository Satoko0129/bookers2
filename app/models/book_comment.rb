class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :book_comments, dependent: :destroy
end
