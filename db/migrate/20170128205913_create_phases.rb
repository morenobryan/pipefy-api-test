class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.string :name
      t.references :pipe, foreign_key: true
      t.integer :index
      t.boolean :can_edit

      t.timestamps
    end
  end
end
