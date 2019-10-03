class Diagnosis < ApplicationRecord
  self.table_name = "diagnoses"
  belongs_to :patient, class_name: 'Patient', foreign_key: :patient_id
  belongs_to :admission, class_name: 'Admission', foreign_key: :admission_id

end