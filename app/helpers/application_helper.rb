module ApplicationHelper

  def full_title(title = "")
    site_title = "Kagikari"

    if title.blank?
      site_title
    else
      title + " | " + site_title
    end
  end
end
