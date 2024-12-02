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

    it 'should return single number if there is a comma' do
      expect(calculator.add('2,')).to eq(2)
    end

    it 'should return sum of numbers if there are multiple numbers' do
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'should return sum of numbers if there are multiple numbers and commas' do
      expect(calculator.add('1,4,')).to eq(5)
    end

    it 'should handle any number of integers' do
      expect(calculator.add('1,2,3,4,5,6,7,8,9,10')).to eq(55)
    end

    it 'should handle any number of integers with commas' do
      expect(calculator.add('1,2,3,4,5,6,7,8,9,10,')).to eq(55)
    end

    it 'should handle any number of integers with new lines' do
      expect(calculator.add('1\n2,3')).to eq(6)
    end

    it 'should handle any number of integers with new lines and commas' do
      expect(calculator.add('1\n2,3,\n')).to eq(6)
    end

    it 'should support different delimiters' do
      expect(calculator.add('//;\n1;2')).to eq(3)
    end

    it 'should support different delimiters' do
      expect(calculator.add('//;\n1;2;4;5;6;;')).to eq(18)
    end
  end
end
