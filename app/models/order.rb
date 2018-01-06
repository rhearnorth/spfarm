class Order < ApplicationRecord
  belongs_to :user
  belongs_to :confirmed_by_user, class_name: 'User'
end
