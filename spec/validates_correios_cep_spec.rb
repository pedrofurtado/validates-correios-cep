# frozen_string_literal: true

RSpec.describe ValidatesCorreiosCep do
  before :each do
    @i18n_scope = ::ActiveModel::Validations::CorreiosCepValidator::CORREIOS_CEP_I18N_SCOPE
    @my_address = MyAddress.new
    @my_address2 = MyAddress2.new
    @my_poro_address = MyPoroAddress.new
    @my_poro_address2 = MyPoroAddress2.new
    @klasses = [@my_address, @my_address2, @my_poro_address, @my_poro_address2]
  end

  it 'valid' do
    @klasses.each do |klass_instance|
      klass_instance.zipcode = '01131010'
      expect(klass_instance.valid?).to eq true
      expect(klass_instance.errors.size).to eq 0
    end
  end

  it 'not_exists' do
    @klasses.each do |klass_instance|
      klass_instance.zipcode = '01234567'
      expect(klass_instance.valid?).to eq false
      expect(klass_instance.errors.size).to eq 1
      expect(klass_instance.errors.full_messages.include?(I18n.t("#{@i18n_scope}.invalid", zipcode: '01234567'))).to eq true
    end
  end

  it 'connection_failed' do
  end

  it 'invalid' do
  end

  it 'timeouted' do
  end
end
