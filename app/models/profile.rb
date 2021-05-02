class Profile < ApplicationRecord
  belongs_to :user

  default_scope { order(created_at: :desc) }
  scope :users, -> { joins(:user) }

  def first_name
    @first_name ||= user.first_name
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

  def editable?(user)
    user_id == user&.id
  end
end
