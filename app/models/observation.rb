class Observation < ApplicationRecord
  self.table_name = "observations"
  belongs_to :admission, class_name: 'Admission', foreign_key: :admission_id

end