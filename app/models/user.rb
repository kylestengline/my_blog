class User < ApplicationRecord
  include Clearance::User
  has_many :lives
  has_many :codes
end
