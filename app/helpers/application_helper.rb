module ApplicationHelper
  def body_class
    "#{controller_name} #{action_name}"
  end

  def check_dashboard_page
    false if current_page?(dashboard_path)
  end
end
