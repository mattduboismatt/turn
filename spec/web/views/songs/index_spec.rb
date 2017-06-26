# frozen_string_literal: true
require "spec_helper"
require_relative "../../../../apps/web/views/songs/index"

RSpec.describe Web::Views::Songs::Index do
  let(:exposures) { Hash[songs: []] }
  let(:template)  { Hanami::View::Template.new("apps/web/templates/songs/index.html.haml") }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #songs" do
    expect(view.songs).to eq exposures.fetch(:songs)
  end

  describe "with no songs" do
    it "shows a placeholder message" do
      expect(rendered).to match("<p class='placeholder'>There are no songs yet.</p>")
    end
  end

  describe "when there are songs" do
    let(:song1)     { Song.new(attributes_for(:song)) }
    let(:song2)     { Song.new(attributes_for(:song)) }
    let(:exposures) { Hash[songs: [song1, song2]] }

    it "lists them all" do
      expect(rendered.scan(/class='song'/).count). to eq 2
      expect(rendered).to match(song1.title)
      expect(rendered).to match(song2.title)
    end

    it "hides the placeholder message" do
      expect(rendered).to_not match("<p class='placeholder'>There are no songs yet.</p>")
    end
  end
end
