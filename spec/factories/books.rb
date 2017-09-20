FactoryGirl.define do
  factory :book do
    title "MyString"
    description "MyText"
    published_at "2017-09-20"
    user nil
    author nil
  end
end
