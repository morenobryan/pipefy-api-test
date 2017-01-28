class CreateTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :types do |t|
      t.string :name
      t.text :component
      t.string :html_class

      t.timestamps
    end
  end
end
