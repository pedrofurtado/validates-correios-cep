class MyPoroAddress
  include ActiveModel::Model
  attr_accessor :zipcode
  validates :zipcode, correios_cep: true
end
