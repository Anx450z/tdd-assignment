require 'rspec'
require_relative 'calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe 'add' do
    context 'default delimiter' do
      it 'should return 0 if string is empty' do 
        expect(calculator.add('')).to eq(0)
      end

      it 'should return 0 if string is nil' do
        expect(calculator.add(nil)).to eq(0)
      end
  
      it 'should return single number if string is a number' do
        expect(calculator.add('1')).to eq(1)
      end
  
      it 'should return single number if there is a comma' do
        expect(calculator.add("2,")).to eq(2)
      end
  
      it 'should return sum of numbers if there are multiple numbers' do
        expect(calculator.add("1,2")).to eq(3)
      end
  
      it 'should return sum of numbers if there are multiple numbers and commas' do
        expect(calculator.add("1,4,")).to eq(5)
      end
  
      it 'should handle any number of integers' do
        expect(calculator.add("1,2,3,4,5,6,7,8,9,10")).to eq(55)
      end
  
      it 'should handle any number of integers with commas' do
        expect(calculator.add("1,2,3,4,5,6,7,8,9,10,")).to eq(55)
      end
  
      it 'should handle any number of integers with new lines' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
  
      it 'should handle any number of integers with new lines and commas' do
        expect(calculator.add("1\n2,3,\n")).to eq(6)
      end

      it 'should ignore number > 1000' do
        expect(calculator.add("1001,2")).to eq(2)
      end

      context 'negative numbers' do
        it 'should raise exception for negative numbers' do
          expect{calculator.add("1,-2,")}.to raise_error(ArgumentError, 'negative numbers not allowed -2')
        end

        it 'should raise exception for negative numbers' do
          expect{calculator.add("1,-2,3")}.to raise_error(ArgumentError, 'negative numbers not allowed -2')
        end

        it 'should raise exception for negative numbers' do
          expect{calculator.add("1,-2\n-3")}.to raise_error(ArgumentError, 'negative numbers not allowed -2,-3')
        end
      end
    end

    context 'different delimiters' do
      it 'should support different delimiters' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
  
      it 'should support different delimiters' do
        expect(calculator.add("//;\n1;2;4;5;6;;")).to eq(18)
      end
      
      ['*','&','^',';','~','.'].each do |delimiter|
        it "should support different delimiters #{delimiter}" do
          expect(calculator.add("//#{delimiter}\n1#{delimiter}2#{delimiter}4#{delimiter}#{delimiter}")).to eq(7)
        end

        context 'negative numbers' do
          it "should raise exception for negative numbers" do
            expect{calculator.add("//#{delimiter}\n1#{delimiter}-2#{delimiter}4#{delimiter}#{delimiter}")}.to raise_error(ArgumentError, 'negative numbers not allowed -2')
          end
    
          it "should raise exception for negative numbers" do
            expect{calculator.add("//#{delimiter}\n1#{delimiter}-2#{delimiter}4#{delimiter}-5#{delimiter}")}.to raise_error(ArgumentError, 'negative numbers not allowed -2,-5')
          end
        end
      end
      context 'multiple delimiters' do
        it 'should support multiple delimiters' do
          expect(calculator.add("//[***]\n1***2***3")).to eq(6)
        end
        it 'should support multiple delimiters' do
          expect(calculator.add("//[**]\n1**2**3")).to eq(6)
        end

        context 'negative numbers' do
          it "should raise exception for negative numbers" do
            expect{calculator.add("//[**]\n1**-2**3")}.to raise_error(ArgumentError, 'negative numbers not allowed -2')
          end
        end
      end
    end
  end
end
