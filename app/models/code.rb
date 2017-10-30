class Code < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged
end
