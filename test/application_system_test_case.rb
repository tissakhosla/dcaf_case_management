require 'test_helper'
require 'integration_helper'
require 'download_helper'

# Set systemtest behavior
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include IntegrationHelper
  include OmniauthMocker

  before { Capybara.reset_sessions! }

  chrome_profile = Selenium::WebDriver::Chrome::Profile.new
  chrome_profile["download.default_directory"] = DownloadHelpers::PATH.to_s

  driven_by :selenium, using: :chrome, screen_size: [1600, 1200], options: {
    profile: chrome_profile
  }
end
