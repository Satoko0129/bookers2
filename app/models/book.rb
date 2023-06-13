class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :facorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true

end
