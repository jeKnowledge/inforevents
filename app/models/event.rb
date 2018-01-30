class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 20}
  validates :description, presence: true, length: { minimum: 10, maximum: 500}
  validates :theme, length: { maximum: 20 }
end
