# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe ValidatesCorreiosCep do
  it 'example test' do
    MyAddress.new
    MyPoroAddress.new
    expect(false).to eq false
  end
end
