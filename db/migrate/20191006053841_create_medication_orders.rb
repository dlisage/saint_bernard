class CreateMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_orders do |t|
      t.string :name, limit: 100
      t.integer :unit
      t.decimal :dosage
      t.integer :route
      t.integer :order_frequency_id
      t.references :patient, foreign_key: true
      t.text  :necessity
      t.timestamps
    end
  end
end
