class GeneralUtils
  def self.log_info(log)
    Logger.new(STDOUT).info(log)
  end

  def self.wait_until_visible(locator_type, locator, wait: 30)
    page.should have_selector(locator_type, locator, wait: wait, visible: true)
  end

end