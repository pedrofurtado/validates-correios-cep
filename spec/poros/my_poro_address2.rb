class MyPoroAddress2
  include ActiveModel::Model
  attr_accessor :zipcode
  validates_correios_cep_of :zipcode
end
