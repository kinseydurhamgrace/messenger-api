class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates :sender, presence: true
  validates :recipient, presence: true
  validates :body, presence: true

  scope :most_recent, -> {
    where('messages.created_at > ?', 1.month.ago)
    .order(created_at: :desc)
    .limit(100)
  }
end
