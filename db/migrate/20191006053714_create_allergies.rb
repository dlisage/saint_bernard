class CreateAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :allergies do |t|
      t.text :description
      t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end
