# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google]

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one :profile, dependent: :destroy
  has_many :family, dependent: :destroy

  def full_name
    "#{first_name} #{second_name} #{last_name}"
  end

  def avatar
    return nil unless profile&.avatar&.attached?

    profile&.avatar
  end
end
