class DiagnosticProcedure < ApplicationRecord
  self.table_name = "diagnostic_procedures"

  belongs_to :patient, class_name: 'Patient', foreign_key: :patient_id

end