FactoryGirl.define do
  factory :code do
    created_at Date.today
    title "Code post title"
    content "Coding speak that not everyone can understand..."

    association :user, factory: :user
  end

  factory :life do
    created_at Date.today
    title "Life post title"
    content "The world moves in mysterious ways; whether we want it to..."

    association :user, factory: :user
  end
end
