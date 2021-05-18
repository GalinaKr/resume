# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, :initial_check, :profile
  include AddFamily

  def show
    certifications
    @profile = Profile.lookup(params[:slug])
  end

  def index
    profile
  end

  def change_family
    family_options

    redirect_after_change_profile
  end

  private

  def profile
    @profile ||= current_user.profile
  end

  def redirect_after_change_profile
    redirect_to profile_step_path(:summary)
  end


end
