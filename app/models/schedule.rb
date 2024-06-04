class Schedule < ApplicationRecord
  enum status: { pending: 'pending', in_progress: 'in_progress', done: 'done'}

  belongs_to :equipament
end
