require 'watir'

module Blackbox
    # Intializes Browser Class
    # Extends Watir::Browser
    ## Documentation
    ## http://www.rubydoc.info/gems/watir
    class Browser < Watir::Browser 
        # Extensions
    end # Browser

    # Adds Capabilities for Remote Driver
    ## Documentation
    ## https://selenium.googlecode.com/svn/trunk/docs/api/rb/Selenium/WebDriver/Remote/Capabilities.html
    class Capabilities < Selenium::WebDriver::Remote::Capabilities
        # Extensions
    end # Capabilities
end