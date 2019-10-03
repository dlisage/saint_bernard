# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_facilities
  Facility.create(name: 'Blue Alps Ski Camp')
end

def seed_admissions
  Admission.create(moment: DateTime.strptime('2019-10-09 10:36:00', '%Y-%m-%d %H:%M:%S'))
  Admission.create(moment: DateTime.strptime('2019-10-09 11:36:00', '%Y-%m-%d %H:%M:%S'))
end

def seed_patients
  Patient.create(first_name: 'John', last_name: 'Smith', dob: Time.zone.now - 30.years - 1.days, mr: '99888', gender: 1, admission: Admission.first)
  Patient.create(first_name: 'Amy', last_name: 'Hill', dob: Time.zone.now - 20.years - 1.days, mr: '77666', gender: 2, admission: Admission.second)
end

def seed_allergies
  Allergy.create(patient: Patient.first, description: 'ABC')
  Allergy.create(patient: Patient.first, description: 'DEF')
  Allergy.create(patient: Patient.second, description: 'Testing Description')
end

def seed_diagnoses
  Diagnosis.create(patient: Patient.first, admission: Admission.first, description: 'abc', code: 'S111', coding_system: 'MED')
  Diagnosis.create(patient: Patient.first, admission: Admission.first, description: 'def', code: 'S222', coding_system: 'MED')
  Diagnosis.create(patient: Patient.second, admission: Admission.second, description: 'def', code: 'S222', coding_system: 'MED')
end

def seed_medications
  frequency = OrderFrequency.create(value: '9', unit: 1)
  MedicationOrder.create(patient: Patient.first, name: 'Med123', necessity: 'N1', unit: 1, dosage: BigDecimal('1.00'), route: 2, frequency: frequency)
  MedicationOrder.create(patient: Patient.first, name: 'Med456', necessity: 'N2', unit: 1, dosage: BigDecimal('1.00'), route: 2, frequency: frequency)
  MedicationOrder.create(patient: Patient.second, name: 'Med789', necessity: 'N3', unit: 1, dosage: BigDecimal('1.00'), route: 2, frequency: frequency)
end

def seed_diagnostic_procedures
  DiagnosticProcedure.create(patient: Patient.first, description: 'd222')
  DiagnosticProcedure.create(patient: Patient.first, description: 'd333')
  DiagnosticProcedure.create(patient: Patient.second, description: 'd444')
end

def seed_treatments
  Treatment.create(patient: Patient.first, description: 'treatment111', necessity: 'N111')
  Treatment.create(patient: Patient.first, description: 'treatment222', necessity: 'N222')
  Treatment.create(patient: Patient.second, description: 'treatment333', necessity: 'N333')
end

def seed_symptoms
  Symptom.create(admission: Admission.first, description: 'D999')
  Symptom.create(admission: Admission.first, description: 'D000')
  Symptom.create(admission: Admission.second, description: 'D5558')
end

def seed_observations
  Observation.create(admission: Admission.first, moment: Time.zone.now, description: 'DOOO')
  Observation.create(admission: Admission.first, moment: Time.zone.now, description: 'Dbbb')
  Observation.create(admission: Admission.second, moment: Time.zone.now, description: 'Dsss')
end

seed_facilities
seed_admissions
seed_patients
seed_allergies
seed_diagnoses
seed_medications
seed_diagnostic_procedures
seed_treatments
seed_symptoms
seed_observations