require "spec_helper"

def response_time(browser)
    if browser.name != :safari
        response = browser.performance.summary[:response_time] / 1000
        puts "Load Time: #{response} seconds."
        return response
    end
end

RSpec.describe UI::Interface do
  it "#something" do
    expect(UI::Interface.hello).to eq('hello')
  end
end

RSpec.describe Blackbox do
  it "#VERSION !NIL" do
    expect(Blackbox::VERSION).not_to be nil
  end
end

RSpec.describe Blackbox::Browser do
  testBrowsers = [:firefox, :chrome, :safari]
  testBrowsers.each do |example|
    describe "#{example.upcase}" do
      it "#WORKS" do   
        browser = Blackbox::Browser.new example
        browser.goto 'https://www.google.com/'  
        expect(browser.url).to eq 'https://www.google.com/'
        expect(browser.ready_state).to eq('complete').or eq('interactive')
        response_time(browser)
        browser.quit
      end # Browser Example
    end
  end # testBrowsers
end # Blackbox::Browser

RSpec.describe Blackbox::Capabilities do
  caps = Blackbox::Capabilities.new 
  testBrowsers = [:firefox, :chrome, :safari]
  testBrowsers.each do |example|
    describe "#{example.upcase} REMOTE" do
      it "#Set" do
        caps[:browser_name] = example
        caps[:takes_screenshot] = 'true'               # Allow Screenshots
        caps[:javascript_enabled] = 'true'             # Allow Javascript
        caps[:native_events] = 'true'                  # Allow NativeEvents
        caps[:css_selectors_enabled] = 'true'          # Allow CSS Selector
        caps[:name] = "Watir WebDriver"
        caps['browserstack.ie.enablePopups'] = 'true'   # IE allows popups; Javascript
        expect(caps.itself).not_to eq(nil)
      end

      it "#WORKS" do
        browser = Blackbox::Browser.new(example, url: 'http://localhost:4444/wd/hub/', opt: caps)
        browser.goto 'https://www.google.com/'  
        expect(browser.url).to eq 'https://www.google.com/'
        response_time(browser)
        browser.quit
      end
    end
  end # testBrowsers
end # Capabilities
