require 'rails_helper'

describe Calculator do
  describe "#calculate" do
    context "multiplying" do
      it 'multiplies 2 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\*[\d]+)/, '*', '10*10+5')).to eq('100+5')
      end

      it 'multiplies 3 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\*[\d]+)/, '*', '10*10+5*10')).to eq('100+50')
      end
    end

    context "dividing" do
      it 'divides 2 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\/[\d]+)/, '/', '10/10+5')).to eq('1+5')
      end

      it 'divides 3 numbers and injects the result into the string' do
        expect(Calculator.loop_calculation_string(/([\d]+\/[\d]+)/, '/', '10/10+20/10')).to eq('1+2')
      end
    end
  end
end
