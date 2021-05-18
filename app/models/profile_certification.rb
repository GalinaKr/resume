# frozen_string_literal: true

class ProfileCertification < ApplicationRecord
  belongs_to :profile
  belongs_to :certification
  has_one :user, through: :profile

  validates :description, presence: true, uniqueness: { scope: :freelancer_profile_id }

  AVAILABLE_YEARS = (40.years.ago.year..Time.now.year).reverse_each

  before_save :update_earned
  attr_accessor :earned_month, :earned_year

  def update_earned
    return unless earned_year.present? && earned_month.present?

    earned = "#{earned_year}-#{earned_month}"
    self.earned = Date.strptime(earned, '%Y-%m')
  end
end
