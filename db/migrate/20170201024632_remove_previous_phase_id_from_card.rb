class RemovePreviousPhaseIdFromCard < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :previous_phase_id, :integer
  end
end
