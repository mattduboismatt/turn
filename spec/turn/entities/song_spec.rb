# frozen_string_literal: true
require "spec_helper"

RSpec.describe Song do
  subject { Song.new(attributes_for(:song)) }

  xit "has a valid factory" do
    subject.valid?
    expect(subject.errors.messages).to eq({})
    song.save!
  end

  it "can be initialized with attributes" do
    title = Faker::Lorem.words(3).join(" ")
    song = Song.new(title: title)
    expect(song.title).to eq title
  end
end
