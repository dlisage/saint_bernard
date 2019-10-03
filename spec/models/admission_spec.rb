require 'rails_helper'

RSpec.describe Admission, type: :model do

  subject { Admission.first }
  let(:patient) { Patient.first }
  let(:diagnosis1) { Diagnosis.first }
  let(:diagnosis2) { Diagnosis.second }
  let(:symptom1) { Symptom.first }
  let(:symptom2) { Symptom.second }
  let(:observation1) { Observation.first }
  let(:observation2) { Observation.second }

  describe "associations" do
    it 'has one patient' do
      expect(subject.patient).to eq(patient)
    end

    it 'has many symptoms' do
      expect(symptom1.admission_id).to eq(subject.id)
      expect(subject.symptoms.size).to eq(2)
      expect(subject.symptoms).to eq([symptom1, symptom2])
    end

    it 'has many diagnoses' do
      expect(subject.diagnoses.size).to eq(2)
      expect(subject.diagnoses).to eq([diagnosis1, diagnosis2])
    end

    it 'has many observations' do
      expect(subject.observations.size).to eq(2)
      expect(subject.observations).to eq([observation1, observation2])
    end
  end

  describe '#date' do
    it 'returns correct date' do
      expect(subject.date).to eq(Date.parse('2019-10-09'))
    end
  end

  describe '#time' do
    it 'returns correct time' do
      expect(subject.time).to eq('10:36')
    end
  end

  describe '#symptoms_descriptions' do
    it 'returns correct symptoms_descriptions' do
      expect(subject.symptoms_descriptions).to eq('D999 and D000')
    end
  end

  describe '#observations_descriptions' do
    it 'returns correct observations_descriptions' do
      expect(subject.observations_descriptions).to eq('DOOO and Dbbb')
    end
  end
end
