module ApplicationHelper

  def auth_token
    input = <<-INPUT
    <input
      type="hidden"
      name="authenticity_token"
      value='#{ form_authenticity_token }'
    />
    INPUT

    input.html_safe
  end
end
