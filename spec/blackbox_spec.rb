require "spec_helper"

RSpec.describe Blackbox do
  it "#VERSION !NIL" do
    expect(Blackbox::VERSION).not_to be nil
  end
end

5.times do
  RSpec.describe Blackbox::Browser do
    testBrowsers = [:firefox, :chrome, :safari]
    testBrowsers.each do |example|
      it "##{example.upcase}" do   
        browser = Blackbox::Browser.new example
        browser.goto 'https://www.google.com/'  
        
        expect(browser.url).to eq 'https://www.google.com/'
        expect(browser.ready_state).to eq('complete').or eq('interactive') 

        if example != :safari
          puts "Load Time: #{browser.performance.summary[:response_time] / 1000} seconds."
        end

        browser.quit
      end # Browser Example
    end # testBrowsers
  end # Blackbox::Browser
end # 5xloop

RSpec.describe Blackbox::Capabilities do
  caps = Blackbox::Capabilities.new 

  it "#Set" do
    caps[:takes_screenshot] = 'true'               # Allow Screenshots
    caps[:javascript_enabled] = 'true'             # Allow Javascript
    caps[:native_events] = 'true'                  # Allow NativeEvents
    caps[:css_selectors_enabled] = 'true'          # Allow CSS Selector
    caps[:name] = "Watir WebDriver"
    caps['browserstack.ie.enablePopups'] = 'true'   # IE allows popups; Javascript
  end

  it "#Inspect" do
    puts caps.inspect
  end
end
