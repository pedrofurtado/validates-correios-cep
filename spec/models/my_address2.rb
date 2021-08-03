class MyAddress2 < ActiveRecord::Base
  self.table_name = 'my_addresses'
  validates_correios_cep_of :zipcode
end
