require "spec_helper"

RSpec.describe Blackbox do
  it "has a version number" do
    expect(Blackbox::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
