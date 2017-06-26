# frozen_string_literal: true
require_relative "../../../../apps/web/controllers/songs/index"

RSpec.describe Web::Controllers::Songs::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repo) { SongRepository.new }

  before do
    repo.clear
    @song = repo.create(attributes_for(:song))
  end

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it "exposes all songs" do
    action.call(params)
    expect(action.exposures[:songs]).to eq [@song]
  end
end
