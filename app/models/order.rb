class Order < ApplicationRecord
  belongs_to :user
  belongs_to :confirmed_by_user, class_name: 'User', optional: true

  scope :waiting_approval_orders, -> { where.not(slip_image: nil) }
  scope :confirmed_orders, -> { where.not(confirmed_at: nil) }
  scope :bought_orders, -> { where(confirmed_at: nil, slip_image: nil) }

  mount_uploader :slip_image, SlipImageUploader

  validates_presence_of :user

  def approve_by(admin)
    self.confirmed_by_user = admin
    self.confirmed_at = DateTime.now
    save
  end
end
