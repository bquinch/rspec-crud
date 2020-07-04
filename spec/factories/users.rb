FactoryBot.define do
  factory :user do
    name     { "George Abitbol" }
    age      { 32 }
    password { "jaimeleslapins" }
    email    { "george@abitbol.com" }

    trait :basile do
      name { "Basile" }
    end

    trait :coralie do
      name { "Coralie" }
    end

    trait :vieux do
      age { 90 }
    end
  end
end
