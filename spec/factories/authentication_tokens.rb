FactoryGirl.define do
  factory :authentication_token do
    token "MyString"
    user nil
    expires_at "2017-09-17 15:53:54"
  end
end
