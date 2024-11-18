class PageHelper


  def self.drag_slider(slider)
    desired_value = 1080
    page.execute_script("arguments[0].setAttribute('aria-valuenow', '#{desired_value}')", slider)
    page.execute_script("arguments[0].style.left = '#{(desired_value / 1439.0) * 100}%'", slider)
  end

end