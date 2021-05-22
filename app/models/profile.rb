# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  default_scope { order(created_at: :desc) }
  scope :users, -> { joins(:user) }
  has_one_attached :avatar
  has_many :families, dependent: :destroy
  has_many :profile_experiences, dependent: :destroy
  has_many :profile_educations, dependent: :destroy
  has_many :profile_certifications, dependent: :destroy
  has_many :languages, dependent: :destroy

  MAX_FILE_SIZE = 2_097_152
  ACCEPTABLE_CONTENT_TYPE = %w[image/jpg image/jpeg image/png image/gif].freeze

  validate :correct_content_type?, :correct_size?

  def first_name
    @first_name ||= user.first_name
  end

  def second_name
    @second_name ||= user.second_name
  end

  def last_name
    @last_name ||= user.last_name
  end

  def full_name
    @full_name ||= user.full_name
  end

  def email
    @email ||= user.email
  end

  def location
    @location ||= user.location
  end

  def personal_tax_number
    @personal_tax_number ||= user.personal_tax_number
  end

  def phone_number
    @phone_number ||= user.phone_number
  end

  private

  def correct_content_type?
    return true if attachment_valid_content_type?(avatar)

    errors.add(:base, 'Selected wrong file type!')
    false
  end

  def correct_size?
    return true if attachment_valid_correct_size?(avatar)

    errors.add(:base, 'File size exceeded 2MB')
    false
  end

  def attachment_valid_content_type?(attachment)
    return true unless attachment.attached?
    return true if ACCEPTABLE_CONTENT_TYPE.include?(attachment.blob.content_type)
    return true if attachment.blob.content_type.blank?

    false
  end

  def attachment_valid_correct_size?(attachment)
    return true unless attachment.attached?
    return true if attachment.blob.byte_size < MAX_FILE_SIZE

    false
  end
end
