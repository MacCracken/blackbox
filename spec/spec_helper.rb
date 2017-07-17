require "bundler/setup"
require "blackbox"

RSpec.configure do |config|
  config.example_status_persistence_file_path = "results/.rspec_run_status"
  
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
