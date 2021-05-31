class UserResume
  include Prawn::View

  def initialize(user)
    @user = user
    content
  end

  def content
    text @user.full_name

    render
  end
end
