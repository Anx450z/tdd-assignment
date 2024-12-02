require 'rspec'
require_relative 'calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe 'add' do
    it 'should return 0 if string is empty' do 
      expect(calculator.add('')).to eq(0)
    end

    it 'should return single number if string is a number' do
      expect(calculator.add('1')).to eq(1)
    end
  end
end
