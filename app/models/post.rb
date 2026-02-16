class Post < ApplicationRecord
  belongs_to :user

  validates :title,  presence: true
  validates :body,   presence: true
  validates :price,  numericality: true
  validates :day,    presence: true
  validates :status, inclusion: { in: [true, false] }

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "day", "id", "price", "status", "title", "update_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end
