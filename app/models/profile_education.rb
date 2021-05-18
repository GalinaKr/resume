# frozen_string_literal: true

class ProfileEducation < ApplicationRecord
  belongs_to :profile
  has_one :user, through: :profile

  validates :institution, presence: true
  validates :degree, presence: true
  validates :course_of_study, presence: true

  AVAILABLE_YEARS = (40.years.ago.year..Time.now.year).reverse_each
  enum degree: { 'BS': 0, 'BA': 1, 'Masters': 2, 'PHD': 3 }
end
