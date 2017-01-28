class CreatePipes < ActiveRecord::Migration[5.0]
  def change
    create_table :pipes do |t|
      t.string :name
      t.string :token
      t.boolean :can_edit
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
