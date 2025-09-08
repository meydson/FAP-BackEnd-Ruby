class Employee
  attr_accessor :id, :name, :salary, :position

  def initialize(id, name, position, salary)
    @id = id
    @name = name
    @position = position
    @salary = salary
  end

  def total_salary
    raise NotImplementedError, "#{self.class} Must implement Method #{__callee__}"
  end
end