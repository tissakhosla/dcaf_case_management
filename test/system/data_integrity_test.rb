require 'application_system_test_case'
require 'download_helper'

# Ensure that data for Patients remains correct and is shown correctly in csv export
class DataIntegrityTest < ApplicationSystemTestCase
  before do
    @admin = create :user,
                    name: 'admin',
                    email: 'admin@dcaf.com',
                    role: :admin
    log_in_as @admin, 'MD'
  end

  describe 'creating and exporting a brand new patient' do
    it 'should not show that patient before they are saved' do
      click_link 'Admin tools'
      click_link 'Export anonymized CSV'
      export_csv = DownloadHelpers::download_content
      assert_not export_csv.nil?
    end
  end
end