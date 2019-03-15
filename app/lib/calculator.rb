class Calculator
  class << self
    def calculate(calculation_string)
      calculation_string.gsub!(/\s+/, '')
      loop_calculation_string(/([\d]+\*[\d]+)/, '*', calculation_string)
      loop_calculation_string(/([\d]+\*[\d]+)/, '/', calculation_string)
    end

    def loop_calculation_string(regex, operator, calculation_string)
    loop do
      break if calculation_string.exclude?(operator)
      calc = calculate_operator(operator, calculation_string.match(regex))
      calculation_string.sub!(regex, calc)
    end
    calculation_string
  end

  def calculate_operator(operator, match)
    match.to_s.split(operator).map(&:to_i).inject(&operator.to_sym).to_s
  end
  end
end

