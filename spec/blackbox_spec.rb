require "spec_helper"

RSpec.describe Blackbox do
  it "has a version number" do
    expect(Blackbox::VERSION).not_to be nil
  end
end

RSpec.describe Blackbox::Browser do
  testBrowsers = [:firefox, :chrome, :safari]
  testBrowsers.each do |example|
      let(:browser) { Blackbox::Browser.new example }
      before { browser.goto 'http://google.com' } 
      after { browser.close }

      it "#{example.upcase}" do 
          expect(browser.url).to eq 'https://www.google.com/'
          expect(browser.ready_state).to eq('complete').or eq('interactive') 
      end
  end # testBrowsers
end # Blackbox::Browser

RSpec.describe Blackbox::Capabilities do
  it "Capabilities" do
    caps = Blackbox::Capabilities.new
    caps[:takes_screenshot] = 'true'               # Allow Screenshots
    caps[:javascript_enabled] = 'true'             # Allow Javascript
    caps[:native_events] = 'true'                  # Allow NativeEvents
    caps[:css_selectors_enabled] = 'true'          # Allow CSS Selector
    caps[:name] = "Watir WebDriver"
    caps['browserstack.ie.enablePopups'] = 'true'   # IE allows popups; Javascript
    puts caps.inspect
  end
end
