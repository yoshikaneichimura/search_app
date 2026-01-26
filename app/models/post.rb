class Post < ApplicationRecord
  belongs_to :user

  validates :title,  presence: true
  validates :body,   presence: true
  validates :price,  numericality: true
  validates :day,    presence: true
  validates :status, inclusion: { in: [true, false] }
end
