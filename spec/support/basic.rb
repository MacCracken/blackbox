def response_time(browser)
    if browser.name != :safari
        response = browser.performance.summary[:response_time] / 1000
        puts "Load Time: #{response} seconds."
        return response
    end
end