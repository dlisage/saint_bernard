class MedicationOrder < ApplicationRecord
  self.table_name = "medication_orders"

  enum unit: { mg: 1 }
  enum route: { PO: 1, IM: 2, SC: 3}
  belongs_to :frequency, class_name: 'OrderFrequency', foreign_key: 'order_frequency_id'
  belongs_to :patient, class_name: 'Patient', foreign_key: :patient_id

end