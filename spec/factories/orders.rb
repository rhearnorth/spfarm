FactoryBot.define do
  factory :order do
    hash_rate "9.99"
    price "MyString"
    user_id 1
    confirmed_at "2018-01-06 14:33:26"
    confirmed_by_user_id 1
    slip_image "MyString"
  end
end
