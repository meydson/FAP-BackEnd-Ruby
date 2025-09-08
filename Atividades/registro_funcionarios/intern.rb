require_relative 'employee'

class Intern < Employee
  def initialize(id, name, position, salary)
    super(id, name,  position, salary)
  end

  def total_salary
    @salary / 2
  end
end