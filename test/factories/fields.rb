FactoryGirl.define do
  factory :field do
    phase
    label 'First field'
    default_value 'default'
    type
    index 1
  end
end
