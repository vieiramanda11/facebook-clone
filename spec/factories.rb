# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Amanda' }
    last_name { 'Vieira' }
    email { 'anotherrrr@email.com.es' }
    password { 'password' }
  end
end

FactoryBot.define do
  factory :user_2 do
    first_name { 'Ansar' }
    last_name { 'Ansar' }
    email { 'ansarrr@gmail.com' }
    password { 'password' }
  end
end

FactoryBot.define do

  factory :confirmed_user, parent: :user do
    after(:create, &:confirm!)
  end
end

