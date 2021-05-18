# frozen_string_literal: true

class Family < ApplicationRecord
  belongs_to :profile
  has_one :user, through: :profile

  def full_name
    "#{f_first_name} #{f_second_name} #{f_last_name}"
  end
end
