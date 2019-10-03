module DiagnosesDescriptionsReusable
  extend ActiveSupport::Concern

  def diagnoses_descriptions_and_codes
    data = diagnoses.map { |diagnosis|  "#{diagnosis.description} (#{diagnosis.code})" }
    data.to_sentence
  end
end