FactoryGirl.define do
  factory :workout do
    user { create(:user) }
    date { Date.today }
    motivation_level 1
    energy_level 1
  end
end
