# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, :initial_check, :profile

  def index
    profile
  end

  private

  def profile
    @profile ||= current_user.profile
  end
end
