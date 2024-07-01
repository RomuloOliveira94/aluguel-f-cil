class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :equipament
  has_one :schedule

  validates_presence_of :period_start, on: :create, message: "não pode ser vazio"
  validates_presence_of :period_end, on: :create, message: "não pode ser vazio"
  validate :period_start_must_be_in_the_future, on: :create
  validate :period_end_must_be_greater_than_period_start, on: :create

  after_create :generate_schedule

  private

  def generate_schedule
    schedule = build_schedule(
      equipament:,
      period_start:,
      period_end: period_end || Date.new(2099, 12, 31)
    )
    schedule.save!
  end

  def period_start_must_be_in_the_future
    return if period_start.blank?

    if period_start < Date.current
      errors.add(:period_start, 'deve ser no futuro')
    end
  end

  def period_end_must_be_greater_than_period_start
    return if period_start.blank? || period_end.blank?

    if period_end <= period_start
      errors.add(:period_end, 'deve ser maior que a data de início')
    end
  end
end
