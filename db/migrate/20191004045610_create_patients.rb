class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name,   limit: 50
      t.string :middle_name,  limit: 50
      t.string :last_name,    limit: 50
      t.string :mr,           limit: 50
      t.datetime :dob
      t.integer :gender
      t.references :admission, foreign_key: true
      t.timestamps
    end
  end
end
