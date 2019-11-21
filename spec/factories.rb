# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Amanda' }
    last_name { 'Vieira' }
    email { 'anotherrrrrrrrrr@gmail.com' }
    password { 'password' }
  end
end

FactoryBot.define do
  factory :confirmed_user, parent: :user do
    after(:create, &:confirm!)
  end
end
