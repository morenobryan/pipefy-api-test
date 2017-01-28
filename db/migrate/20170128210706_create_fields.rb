class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.references :phase, foreign_key: true
      t.string :label
      t.string :default_value
      t.references :type, foreign_key: true
      t.integer :index

      t.timestamps
    end
  end
end
