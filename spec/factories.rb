FactoryBot.define do
  factory :admission do
    moment { Time.now }
  end

  factory :patient do
    first_name  { 'John' }
    middle_name { '' }
    last_name  { 'Smith' }
    dob { Time.new - 30.years - 1.days }
    gender { 1 }
  end

  factory :diagnosis do
    coding_system { 'medical' }
    code { "S#{Random.rand(300)}" }
    description { 'diagnosis description' }
  end

  factory :allergy do
    description { 'allergy description' }
  end

  factory :order_frequency do
    value { "value #{Random.rand(1000)} " }
    unit { 1 }
  end

  factory :medication_order do
    name { "name #{Random.rand(1000)}" }
    unit { 1 }
    dosage { BigDecimal('1.00') }
    route { Random.rand(1..3) }
    frequency { create(:order_frequency) }
    necessity { " medication_order necessity #{Random.rand(1000)}" }
  end

  factory :diagnostic_procedure do
    description { " diagnostic procedure description #{Random.rand(1000)} "}
    moment { Time.now }
  end

  factory :treatment do
    description { " treatment description #{Random.rand(1000)} "}
    necessity { " treatment necessity #{Random.rand(1000)}" }
  end
end
