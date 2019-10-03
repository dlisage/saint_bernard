class OrderFrequency < ApplicationRecord
  self.table_name = "order_frequencies"
  enum unit: { hour: 1}

end