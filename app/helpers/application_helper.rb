module ApplicationHelper
  def body_class
    "#{controller_name} #{action_name}"
  end

  def avatar_url(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
  end

  def check_dashboard_page
    false if current_page?(dashboard_path)
  end
end
