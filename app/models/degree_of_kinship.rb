# frozen_string_literal: true

class DegreeOfKinship < ApplicationRecord
  include Translatable

  has_many :families, dependent: :destroy
  has_many :profiles, through: :degree_of_kinships

  #validates description, uniqueness: true
  translates :description

  def description
    translation_for(:description)
  end
end
