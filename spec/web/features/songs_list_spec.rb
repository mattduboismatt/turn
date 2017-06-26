# frozen_string_literal: true
require "features_helper"

RSpec.describe "Songs List" do
  let(:repo) { SongRepository.new }

  before do
    repo.clear
    2.times { repo.create(attributes_for(:song)) }
  end

  it "displays a list of songs" do
    visit "/songs"

    within "#songs" do
      expect(page.body).to have_css(".song", count: 2)
    end
  end
end
