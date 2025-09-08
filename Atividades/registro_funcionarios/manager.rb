require_relative 'employee'

class Manager < Employee
  attr_accessor :commission

  def initialize(id, name, position, salary, bonus)
    super(id, name, position, salary)
    @bonus = bonus
  end

  def total_salary
    @salary + @bonus
  end
end