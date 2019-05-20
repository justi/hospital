require "application_system_test_case"

class StaffsTest < ApplicationSystemTestCase
  setup do

  end

  def cont(r)
    r =~ /event/i
  end

  test "visiting the index" do
    visit "https://colonyhs-cjuhsd-ca.schoolloop.com/pf4/cms2_site/view_deployment?d=x&theme_id=i2gg88a1x1oh1oq&group_id=1500178971803"
    page.driver.network_traffic.each do |request|
      next unless cont(request.response.url)
      puts "\n URL #{request.response.url}: \n Status #{request.response.status}"
      puts request.response.data
      binding.pry
    end
    Capybara.always_include_port = true
  end
end
