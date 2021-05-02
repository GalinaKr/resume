class ProfileStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal_info, :family
  before_action :set_user, :set_profile

  def show
    @user.reload unless @user.profile.present?
    #populate_available_options_for_data

    render_wizard
  end

  def update
    personal_info_save || family_save
  end

  def personal_info_save
    #byebug
    return false unless wizard_value(step) == :personal_info

    render_wizard @user

    true
  end

  def family_save
    return false unless wizard_value(step) == :family

    render_wizard @user

    true
  end

  private

  def set_user
    @user ||= current_user
  end

  def set_profile
    @profile = @user.profile || Profile.create(user_id: @user.id)
  end

end
