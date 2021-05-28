# frozen_string_literal: true

class Language < ApplicationRecord
  belongs_to :profile
  belongs_to :language_level
  has_one :user, through: :profile
end
