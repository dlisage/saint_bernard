class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.string :coding_system
      t.string :code
      t.text :description
      t.references :patient, foreign_key: true
      t.references :admission, foreign_key: true
      t.timestamps
    end
  end
end
