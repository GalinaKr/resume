class Family < ApplicationRecord
  belongs_to :profile
  has_one :user, through: :profile
end
