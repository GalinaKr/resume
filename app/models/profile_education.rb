# frozen_string_literal: true

class ProfileEducation < ApplicationRecord
  belongs_to :profile
  belongs_to :degree
  belongs_to :form_of_education

  has_one :user, through: :profile

  validates :institution, presence: true
  validates :course_of_study, presence: true

  AVAILABLE_YEARS = (40.years.ago.year..Time.now.year).reverse_each
end
