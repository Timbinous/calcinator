class DashboardController < ApplicationController
  def index
  end

  def calculate
    @result = Calculator.calculate(params[:calculating_string])
  end

end
