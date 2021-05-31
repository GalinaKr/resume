class UserResume
  include Prawn::View

  def initialize
    content
  end

  def content
    text "Hello World!"

    render
  end
end
