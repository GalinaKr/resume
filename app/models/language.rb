# frozen_string_literal: true

class Language < ApplicationRecord
  belongs_to :profile
  has_one :user, through: :profile
end
