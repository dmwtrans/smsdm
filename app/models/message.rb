class Message < ApplicationRecord
  scope :for_number,        -> (number) { where(number: number).by_date }
  scope :by_date,           -> { order(created_at: :desc) }

  validates :text,
    presence: true,
    allow_blank: false
end
