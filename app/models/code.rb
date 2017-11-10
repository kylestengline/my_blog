class Code < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  # will_paginate
  self.per_page = 10
end
