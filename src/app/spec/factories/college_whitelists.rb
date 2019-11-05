FactoryBot.define do
  factory :college_whitelist do
    association :user, factory: :user
    association :college, factory: :college

    trait :pending do
      status {:pending}
    end

    trait :approved do
      status {:approved}
    end

    trait :rejected do
      status {:rejected}
    end

    factory :college_whitelist_pending,    traits: [:pending]
    factory :college_whitelist_approved,   traits: [:approved]
    factory :college_whitelist_rejected,  traits: [:rejected]
  end
end
