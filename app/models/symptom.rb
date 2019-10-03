class Symptom < ApplicationRecord
  self.table_name = "symptoms"
  belongs_to :admission, class_name: 'Admission', foreign_key: :admission_id

end