# frozen_string_literal: true

RSpec.describe ValidatesCorreiosCep do
  before :each do
    @my_address = MyAddress.new
    @my_address2 = MyAddress2.new
    @my_poro_address = MyPoroAddress.new
    @my_poro_address2 = MyPoroAddress2.new
    @klasses = [@my_address, @my_address2, @my_poro_address, @my_poro_address2]
  end

  describe 'ActiveRecord' do
    describe 'built-in validations' do
      it 'valid' do
        @klasses.each do |klass_instance|
          klass_instance.zipcode = '01131010'
          expect(klass_instance.valid?).to eq true
          expect(klass_instance.errors.size).to eq 0
        end
      end

      it 'not_exists' do
      end

      it 'connection_failed' do
      end

      it 'invalid' do
      end

      it 'timeouted' do
      end
    end

    describe 'validation custom method' do
      it 'valid' do
      end

      it 'not_exists' do
      end

      it 'connection_failed' do
      end

      it 'invalid' do
      end

      it 'timeouted' do
      end
    end
  end

  describe 'ActiveModel' do
    describe 'built-in validations' do
      it 'valid' do
      end

      it 'not_exists' do
      end

      it 'connection_failed' do
      end

      it 'invalid' do
      end

      it 'timeouted' do
      end
    end

    describe 'validation custom method' do
      it 'valid' do
      end

      it 'not_exists' do
      end

      it 'connection_failed' do
      end

      it 'invalid' do
      end

      it 'timeouted' do
      end
    end
  end
end
