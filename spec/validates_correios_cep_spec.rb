# frozen_string_literal: true

RSpec.describe ValidatesCorreiosCep do
  before :each do
    @klasses = [
      MyAddress.new,
      MyAddress2.new,
      MyPoroAddress.new,
      MyPoroAddress2.new
    ]
  end

  it 'valid' do
    @klasses.each do |klass_instance|
      klass_instance.zipcode = '01131010'
      expect(klass_instance.valid?).to eq true
      expect(klass_instance.errors.size).to eq 0
      sleep 1
    end
  end

  it 'not_exists' do
    @klasses.each do |klass_instance|
      klass_instance.zipcode = '01234567'
      expect(klass_instance.valid?).to eq false
      expect(klass_instance.errors.size).to eq 1
      expect(klass_instance.errors.full_messages.include?('Zipcode translation missing: en.correios_cep.errors.messages.not_exists')).to eq true
      sleep 1
    end
  end

  it 'invalid' do
    @klasses.each do |klass_instance|
      klass_instance.zipcode = 'invalid'
      expect(klass_instance.valid?).to eq false
      expect(klass_instance.errors.size).to eq 1
      expect(klass_instance.errors.full_messages.include?('Zipcode translation missing: en.correios_cep.errors.messages.invalid')).to eq true
      sleep 1
    end
  end

  it 'timeouted' do
    ::Correios::CEP.configure do |config|
      config.request_timeout = 0
    end

    @klasses.each do |klass_instance|
      klass_instance.zipcode = '01131010'
      expect(klass_instance.valid?).to eq false
      expect(klass_instance.errors.size).to eq 1
      expect(klass_instance.errors.full_messages.include?('Zipcode translation missing: en.correios_cep.errors.messages.timeouted')).to eq true
      sleep 1
    end
  end
end
