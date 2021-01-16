FactoryBot.define do
  factory :message do
    subject { "A subject" }
    content { "Je suis le plus classe du monde" }
    from { "george@abitbol.com" }
    name { "George Abitbol" }

    trait :invalid do
      from { "lololo" }
    end
  end
end
