# frozen_string_literal: true
require "bundler/setup"
require "hanami/setup"
require "hanami/model"
require_relative "../lib/turn"
require_relative "../apps/web/application"
require "haml"

Haml::TempleEngine.disable_option_validator!

Hanami.configure do
  mount Web::Application, at: "/"

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/turn_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/turn_development'
    #    adapter :sql, 'mysql://localhost/turn_development'
    #
    adapter :sql, ENV["DATABASE_URL"]

    ##
    # Migrations
    #
    migrations "db/migrations"
    schema     "db/schema.sql"
  end

  mailer do
    root "lib/turn/mailers"

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp, address: ENV["SMTP_HOST"], port: ENV["SMTP_PORT"]
    end
  end
end
