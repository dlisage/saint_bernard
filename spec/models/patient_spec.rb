# frozen_string_literal: true

# KudosQuantity model spec
require 'rails_helper'

RSpec.describe Patient, type: :model do

  subject { Patient.first }
  let(:admission) { Admission.first }
  let(:allergy1) { Allergy.first }
  let(:allergy2) { Allergy.second }
  let(:diagnosis1) { Diagnosis.first }
  let(:diagnosis2) { Diagnosis.second }
  let(:medication_order1) { MedicationOrder.first }
  let(:medication_order2) { MedicationOrder.second }
  let(:diagnostic_procedure1) { DiagnosticProcedure.first }
  let(:diagnostic_procedure2) { DiagnosticProcedure.second }
  let(:treatment1) { Treatment.first }
  let(:treatment2) { Treatment.second }

  describe "associations" do
    it 'belongs_to admission' do
      expect(subject.admission).to eq(admission)
    end

    it 'has many allergies' do
      expect(allergy1.patient_id).to eq(subject.id)
      expect(subject.allergies.size).to eq(2)
      expect(subject.allergies).to eq([allergy1, allergy2])
    end

    it 'has many chronic_conditions' do
      expect(subject.chronic_conditions.size).to eq(2)
      expect(subject.chronic_conditions).to eq([diagnosis1, diagnosis2])
    end

    it 'has many medications' do
      expect(subject.medications.size).to eq(2)
      expect(subject.medications).to eq([medication_order1, medication_order2])
    end

    it 'has many diagnostic_procedures' do
      expect(subject.diagnostic_procedures.size).to eq(2)
      expect(subject.diagnostic_procedures).to eq([diagnostic_procedure1, diagnostic_procedure2])
    end

    it 'has many diagnoses' do
      expect(subject.diagnoses.size).to eq(2)
      expect(subject.diagnoses).to eq([diagnosis1, diagnosis2])
    end

    it 'has many treatments' do
      expect(subject.treatments.size).to eq(2)
      expect(subject.treatments).to eq([treatment1, treatment2])
    end
  end

  describe '#age' do
    it 'returns correct age' do
      expect(subject.age).to eq(30)
    end
  end

  describe '#allergies_descriptions' do
    it 'returns correct allergies_descriptions' do
      expect(subject.allergies_descriptions).to eq('ABC and DEF')
    end
  end

  describe '#diagnoses_descriptions_and_codes' do
    it 'returns correct diagnoses_descriptions_and_codes' do
      expect(subject.diagnoses_descriptions_and_codes).to eq('abc (S111) and def (S222)')
    end
  end

  describe '#diagnostic_procedures_descriptions' do
    it 'returns correct diagnostic_procedures_descriptions' do
      sentence = subject.diagnostic_procedures_descriptions
      expect(sentence.include?('d222')).to be_truthy
      expect(sentence.include?('d333')).to be_truthy
      expect(sentence.include?('and')).to be_truthy
      expect(sentence.include?('on')).to be_truthy
      expect(sentence.include?('at')).to be_truthy
    end
  end

  describe '#medications_descriptions' do
    it 'returns correct medications_descriptions' do
      sentence = subject.medications_descriptions
      expect(sentence.include?('Med123')).to be_truthy
      expect(sentence.include?('Med456')).to be_truthy
      expect(sentence.include?('N1')).to be_truthy
      expect(sentence.include?('N2')).to be_truthy
      expect(sentence.include?('to')).to be_truthy
      expect(sentence.include?('and')).to be_truthy
    end
  end

  describe '#treatments_descriptions' do
    it 'returns correct treatments_descriptions' do
      sentence = subject.treatments_descriptions
      expect(sentence.include?('treatment111')).to be_truthy
      expect(sentence.include?('treatment222')).to be_truthy
      expect(sentence.include?('N111')).to be_truthy
      expect(sentence.include?('N222')).to be_truthy
      expect(sentence.include?('and')).to be_truthy
    end
  end
end
