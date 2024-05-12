class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :dob, presence: true
  validates :mobile_phone, presence: true
end
