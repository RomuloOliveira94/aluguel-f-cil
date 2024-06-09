class Schedule < ApplicationRecord
  enum status: { pending: 'pending', in_progress: 'in_progress', done: 'done'}

  belongs_to :equipament
  belongs_to :order, optional: true
end
