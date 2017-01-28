class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.datetime :due_date
      t.float :duration
      t.datetime :started_at
      t.datetime :finished_at
      t.datetime :expiration_time
      t.integer :index
      t.string :token
      t.boolean :expired
      t.boolean :late
      t.boolean :draft
      t.boolean :done
      t.boolean :can_show_pipe
      t.timestamps
    end

    add_column :cards, :current_phase_id, :integer
    add_column :cards, :previous_phase_id, :integer
    add_column :cards, :next_phase_id, :integer

    add_foreign_key :cards, :phases, column: :current_phase_id
    add_foreign_key :cards, :phases, column: :previous_phase_id
    add_foreign_key :cards, :phases, column: :next_phase_id
  end
end
