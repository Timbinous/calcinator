require 'rails_helper'

describe Calculator do
  describe "#calculate" do
    context "multiplying" do
      it 'multiplies 2 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\*[\d]+)/, '*', '10*10+5')).to eq('100.0+5')
      end

      it 'multiplies 3 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\*[\d]+)/, '*', '10*10+5*10')).to eq('100.0+50.0')
      end
    end

    context "dividing" do
      it 'divides 2 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\/[\d]+)/, '/', '10/10+5')).to eq('1.0+5')
      end

      it 'divides 3 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\/[\d]+)/, '/', '10/10+20/10')).to eq('1.0+2.0')
      end
    end

    context "adding" do
      it 'adds 2 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\+[\d]+)/, '+', '10/10+20/10')).to eq('10/30.0/10')
      end

      it 'adds 3 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\+[\d]+)/, '+', '10+10/20+10')).to eq('20.0/30.0')
      end
    end

    context "subtracting" do
      it 'subtracts 2 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\-[\d]+)/, '-', '10/20-10/10')).to eq('10/10.0/10')
      end

      it 'subtracts 3 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\-[\d]+)/, '-', '10-10/20-10')).to eq('0.0/10.0')
      end
    end

    context "using calculate" do
      it 'uses the correct order of operations to get the right answer' do
        expect(Calculator.calculate('10*10/2+5*10')).to eq(100)
      end
    end

    context "code exercise examples" do
      it 'calculates the first example correctly' do
        expect(Calculator.calculate('5*3+1+6/2+9*100')).to eq(919)
      end

      it 'calculates the second example correctly' do
        expect(Calculator.calculate('5*3+1+6/85+9*100')).to eq(916.07)
      end
    end
  end
end
