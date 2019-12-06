# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Amanda' }
    last_name { 'Vieira' }
    email { 'anotherrrr@email.com.es' }
    password { 'password' }
  end

  factory :random_user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end

