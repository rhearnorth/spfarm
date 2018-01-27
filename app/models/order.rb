class Order < ApplicationRecord
  belongs_to :user
  belongs_to :confirmed_by_user, class_name: 'User'
  mount_uploader :slip_image, SlipImageUploader
end
