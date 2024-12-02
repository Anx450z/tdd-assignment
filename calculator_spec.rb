require 'rspec'
require_relative 'calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe 'add' do
    it 'returns 0 if string is empty' do 
      expect(calculator.add('')).to eq(0)
    end
  end
end
