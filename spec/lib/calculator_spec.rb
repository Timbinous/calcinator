require 'rails_helper'

describe Calculator do
  describe "#calculate" do
    context "multiplying" do
      it 'multiplies 2 numbers and injects the result into the string' do
        expect(Calculator.calculate('10*10 + 5')).to eq('100+5')
      end

      it 'multiplies 3 numbers and injects the result into the string' do
        expect(Calculator.calculate('10*10+5*10')).to eq('100+50')
      end
    end
  end
end
