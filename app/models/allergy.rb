class Allergy < ApplicationRecord
  self.table_name = "allergies"
  belongs_to :patient, class_name: 'Patient', foreign_key: :patient_id

end