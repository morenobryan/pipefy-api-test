class CreateFieldValues < ActiveRecord::Migration[5.0]
  def change
    create_table :field_values do |t|
      t.references :field, foreign_key: true
      t.string :value
      t.string :display_value
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
