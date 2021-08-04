class MyAddress < ActiveRecord::Base
  validates :zipcode, correios_cep: true
end
