module ApplicationHelper

  def japanese_day_names
    %w(日 月 火 水 木 金 土)
  end

  def bs4_bgcolor_for(flash_key)
    case flash_key
    when "success"
      "alert-success"
    when "error"
      "alert-danger"
    when "alert"
      "alert-warning"
    when "notice"
      "alert-info"
    else
      flash_key.to_s
    end
  end
end
