# frozen_string_literal: true
FactoryGirl.define do
  factory :song do
    title { Faker::Lorem.words(3).join(" ") }
  end
end
