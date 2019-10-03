class Treatment < ApplicationRecord
  self.table_name = "treatments"
  belongs_to :patient, class_name: 'Patient', foreign_key: :patient_id

end