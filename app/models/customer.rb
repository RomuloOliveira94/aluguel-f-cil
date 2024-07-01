class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :dob, presence: true
  validates :mobile_phone, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[name email dob mobile_phone]
  end
end
