class Patient < ApplicationRecord
  include ::DiagnosesDescriptionsReusable

  self.table_name = "patients"
  enum gender: { male: 1, female: 2 , other: 3 }
  belongs_to :admission
  has_many :allergies, class_name: 'Allergy', foreign_key: :patient_id, dependent: :destroy, inverse_of: :patient
  has_many :diagnoses, class_name: 'Diagnosis', foreign_key: :patient_id, dependent: :destroy, inverse_of: :patient
  has_many :diagnostic_procedures, class_name: 'DiagnosticProcedure', foreign_key: :patient_id, dependent: :destroy, inverse_of: :patient
  has_many :medications, class_name: 'MedicationOrder', foreign_key: :patient_id, dependent: :destroy, inverse_of: :patient
  has_many :treatments, class_name: 'Treatment', foreign_key: :patient_id, dependent: :destroy, inverse_of: :patient

  def age
    ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end

  def allergies_descriptions
    data = allergies.map { |allergy| allergy.description }
    data.to_sentence
  end

  def chronic_conditions
    diagnoses
  end

  def chronic_conditions_descriptions
    diagnoses_descriptions_and_codes
  end

  def diagnostic_procedures_descriptions
    data = diagnostic_procedures.map do |dp|
      [dp.description, 'on', admission.date.to_s, 'at', admission.time.to_s ].join(' ')
     end
   data.to_sentence
  end

  def medications_descriptions
    data = medications.map do |medication|
       [medication.name, medication.dosage, medication.route, "#{medication.frequency.value} #{medication.frequency.unit}", 'to', medication.necessity].join(' ')
      end
    data.to_sentence
  end

  def treatments_descriptions
    data = treatments.map do |treatment|
      [treatment.description, 'to', treatment.necessity].join(' ')
     end
   data.to_sentence
  end
end