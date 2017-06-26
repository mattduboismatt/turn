# frozen_string_literal: true
module Web::Controllers::Songs
  class Index
    include Web::Action

    expose :songs

    def call(_params)
      @songs = SongRepository.new.all
    end
  end
end
