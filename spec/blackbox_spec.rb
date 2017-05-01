require "spec_helper"

RSpec.describe Blackbox do
  it "has a version number" do
    expect(Blackbox::VERSION).not_to be nil
  end
end

RSpec.describe Blackbox::Browser do
  it "Firefox" do
    browser = Blackbox::Browser.new :firefox
    browser.goto 'https://www.google.com'
    expect(browser.url).to eq 'https://www.google.com/'
    browser.quit
  end

  it "Chrome" do
    browser = Blackbox::Browser.new :chrome
    browser.goto 'https://www.google.com'
    expect(browser.url).to eq 'https://www.google.com/'
    browser.quit
  end

  it "Safari" do
    browser = Blackbox::Browser.new :safari
    browser.goto 'https://www.google.com'
    expect(browser.url).to eq 'https://www.google.com/'
    browser.quit
  end

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
