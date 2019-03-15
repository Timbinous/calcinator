class DashboardController < ApplicationController
  def index
  end

  def calculate
    @original_question = params[:calculating_string].dup
    @result = Calculator.calculate(params[:calculating_string])
  end

end
