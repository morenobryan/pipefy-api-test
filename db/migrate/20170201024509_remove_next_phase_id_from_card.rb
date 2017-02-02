class RemoveNextPhaseIdFromCard < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :next_phase_id, :integer
  end
end
