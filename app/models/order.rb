class Order < ApplicationRecord
  belongs_to :user
  belongs_to :confirmed_by_user, class_name: 'User', optional: true

  mount_uploader :slip_image, SlipImageUploader

  validates_presence_of :user

  def approve_by(admin)
    self.confirmed_by_user = admin
    self.confirmed_at = DateTime.now
    save
  end
end
