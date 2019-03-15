class Calculator
  class << self
    def calculate(calculating_string)
      calculating_string.gsub!(/\s+/, '')
      multiply calculating_string
      divide calculating_string
    end

    def multiply(calculating_string)
      regex = /([\d]+\*[\d]+)/
      loop do
        break if calculating_string.exclude?('*')
        calc = calculate_multiply(calculating_string.match(regex))
        calculating_string.sub!(regex, calc)
      end
      calculating_string
    end

    def calculate_multiply(match)
      match.to_s.split('*').map(&:to_i).inject(:*).to_s
    end

    def divide(calculating_string)
      regex = /([\d]+\/[\d]+)/
      loop do
        break if calculating_string.exclude?('/')
        calc = calculate_divide(calculating_string.match(regex))
        calculating_string.sub!(regex, calc)
      end
      calculating_string
    end

    def calculate_divide(match)
      match.to_s.split('/').map(&:to_i).inject(:/).to_s
    end
  end
end

