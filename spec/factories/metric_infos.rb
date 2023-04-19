FactoryBot.define do
  factory :metric_info do
    timestamp_value { Time.current }
    name { "MyString" }
    value { rand(1.0..99.9) }
  end
end
