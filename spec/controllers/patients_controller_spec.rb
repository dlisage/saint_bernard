require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  render_views

  describe '#index' do
    context 'html request' do
      it 'renders correct html content' do
        get :index, format: :html
        expect(response.status).to eq 200
        expect(response.body).to include('Saint Bernard')
        expect(response.body).to have_selector('nav')
        expect(response.body).to have_selector('div.input-group')
      end
    end

    context 'json request' do
      it 'renders correct json data' do
        get :index, format: :json
        expect(response.status).to eq 200
        result = JSON.parse(response.body)
        expect(result[0]['first_name']).to eq('John')
        expect(result[1]['first_name']).to eq('Amy')
      end
    end
  end

  describe '#show' do
    let(:para1) { 'This 30 years old male was admitted to Blue Alps Ski Camp on 2019-10-09 at 10:36  due to abc (S111) and def (S222). The observed symptoms on admission were D999 and D000.  DOOO and Dbbb' }
    let(:para2) { 'Upon asking about known allergies, the patient disclosed ABC and DEF. Upon asking about chronic conditions, the patient disclosed abc (S111) and def (S222). The patient was administered with Med123 1.0 IM 9 hour to N1 and Med456 1.0 IM 9 hour to N2.' }
    let(:para3) { 'The staff performed d222 on 2019-10-09 at 10:36 and d333 on 2019-10-09 at 10:36 , revealing abc (S111) and def (S222). Our team proceeded to treatment111 to N111 and treatment222 to N222.' }
    let(:params) { { id: Patient.first.id } }
    it 'renders correct html content' do
      get :show, format: :html, params: params
      expect(response.status).to eq 200
      expect(response.body).to include('Emergency Transfer Summary (Form 34L-D)')
      expect(response.body).to include('Transferring Facility')
      expect(response.body).to include('Patient Information')
      expect(response.body).to include('John')
      expect(response.body).to include('Smith')
      expect(response.body).to include(para1)
      expect(response.body).to include(para2)
      expect(response.body).to include(para3)
      expect(response.body).to have_selector('div.summary_section')
      expect(response.body).to have_selector('table.table-bordered')

    end
  end
end
