class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :equipament, null: false, foreign_key: true
      t.string :status, default: 'pending' # pending, in_progress, done
      t.date :period_start, null: false
      t.date :period_end

      t.timestamps
    end
    add_index :schedules, :status
  end
end
