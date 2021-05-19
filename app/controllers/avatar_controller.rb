# frozen_string_literal: true

class AvatarController < BaseAvatarsController
  def update
    #byebug
    return unless valid_input_file?

    @user = current_user
    @profile = @user.profile
    @profile.avatar.purge_later if @profile.avatar.attached?
    process_and_save_new_image!(@profile)

    render json: { status: :ok }
  rescue StandardError
    handle_rescue
  end

  def destroy
    return unless current_user.profile.avatar.attached?

    current_user.profile.avatar.purge_later
    render json: { status: :ok }
  end

  private

  def handle_rescue
    @profile.avatar.purge_later
    @profile.errors.add(:base, 'Avatar was deleted due to errors')
  end

end
