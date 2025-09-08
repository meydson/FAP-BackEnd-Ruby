require_relative 'employee'

class SalesForce < Employee
  attr_accessor :commission

  def initialize(id, name, position, salary, commission)
    super(id, name, position, salary)
    @commission = commission
  end

  def total_salary
    @salary + @commission
  end
end