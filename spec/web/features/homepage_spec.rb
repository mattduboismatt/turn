# frozen_string_literal: true
require "features_helper"

RSpec.describe "Visiting the homepage" do
  it "is successful" do
    visit "/"
    expect(page.body).to match(/songs/i)
    expect(page.body).to match(/shows/i)
  end
end
