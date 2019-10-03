class Admission < ApplicationRecord
  include ::DiagnosesDescriptionsReusable
  self.table_name = "admissions"
  has_one :patient, class_name: 'Patient', autosave: true, foreign_key: :admission_id, dependent: :destroy
  has_many :diagnoses, class_name: 'Diagnosis', foreign_key: :admission_id, dependent: :destroy, inverse_of: :admission
  has_many :symptoms, class_name: 'Symptom', foreign_key: :admission_id, dependent: :destroy, inverse_of: :admission
  has_many :observations, class_name: 'Observation', foreign_key: :admission_id, dependent: :destroy, inverse_of: :admission

  def date
    moment.to_date
  end

  def time
    moment.to_s(:time)
  end

  def symptoms_descriptions
    data = symptoms.map { |symptom|  symptom.description }
    data.to_sentence
  end

  def observations_descriptions
    data = observations.map { |observation|  observation.description }
    data.to_sentence
  end
end