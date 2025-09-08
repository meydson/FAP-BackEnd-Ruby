require_relative "./employee"
require_relative "./manager"
require_relative "./sales_force"
require_relative "./intern"

class Interface
  def initialize
    @employees = []
    @next_id = 1
  end

  def register_employee
    puts "Digite o nome do funcionário:"
    name = gets.chomp
    puts "Digite o cargo do funcionário:"
    position = gets.chomp
    puts "Digite o salário do funcionário:"
    salary = gets.chomp.to_f

    employee = {
      id: @next_id,
      name: name,
      position: position,
      salary: salary
    }

    
    case position.downcase
    when "manager"
      puts "Digite o bônus do gerente:"
      bonus = gets.chomp.to_f
      employee = Manager.new(@next_id, name, position, salary, bonus)
      @employees << employee
      @next_id += 1
    when "salesforce"
      puts "Digite a comissão do vendedor:"
      commission = gets.chomp.to_f
      employee = SalesForce.new(@next_id, name, position, salary, commission)
      @employees << employee
      @next_id += 1
    when "intern"
      employee = Intern.new(@next_id, name, position, salary)
      @employees << employee
      @next_id += 1
    else
      puts "Cargo inválido. Funcionário não registrado."
    end
    
    

    
    puts "Funcionário registrado com sucesso!"
  end

  def list_employees
    puts "Lista de Funcionários:"
    @employees.each do |emp|
      puts "ID: #{emp.id}, Nome: #{emp.name}, Cargo: #{emp.position}, Salário: #{emp.salary}"
    end
  end

  def search_employee_id
    puts "Digite o ID do funcionário que deseja buscar:"
    id = gets.chomp.to_i
    emp = @employees.find { |e| e.id == id }
    if emp
      puts "Funcionário encontrado: ID: #{emp.id}, Nome: #{emp.name}, Cargo: #{emp.position}, Salário: #{emp.salary}"
    else
      puts "Funcionário com ID #{id} não encontrado."
    end
  end

  def search_employee_name
    puts "Digite o nome do funcionário que deseja buscar:"
    name = gets.chomp
    emp = @employees.find { |e| e.name.downcase.include?(name.downcase) }
    if emp
      puts "Funcionário encontrado: ID: #{emp.id}, Nome: #{emp.name}, Cargo: #{emp.position}, Salário: #{emp.salary}"
    else
      puts "Funcionário com nome '#{name}' não encontrado."
    end
  end

  def update_employee
    puts "Digite o ID do funcionário que deseja atualizar:"
    id = gets.chomp.to_i
    emp = @employees.find { |e| e.id == id }
    if emp
      puts "Digite o novo nome do funcionário (atual: #{emp.name}):"
      emp.name = gets.chomp
      #puts "Digite o novo cargo do funcionário (atual: #{emp[:position]}):"
      #emp[:position] = gets.chomp
      puts "Digite o novo salário do funcionário (atual: #{emp.salary}):"
      emp.salary = gets.chomp.to_f
      puts "Funcionário atualizado com sucesso!"
    else
      puts "Funcionário com ID #{id} não encontrado."
    end
  end

  def delete_employee
    puts "Digite o ID do funcionário que deseja deletar:"
    id = gets.chomp.to_i
    emp = @employees.find { |e| e[:id] == id }
    if emp
      @employees.delete(emp)
      puts "Funcionário deletado com sucesso!"
    else
      puts "Funcionário com ID #{id} não encontrado."
    end
  end
end

def main
  interface = Interface.new

  loop do
    puts "\nMenu de Opções:"
    puts "1. Registrar Funcionário"
    puts "2. Listar Funcionários"
    puts "3. Buscar Funcionário por ID"
    puts "4. Buscar Funcionário por Nome"
    puts "5. Atualizar Funcionário"
    puts "6. Deletar Funcionário"
    puts "7. Sair"
    print "Escolha uma opção: "
    choice = gets.chomp.to_i

    case choice
    when 1
      interface.register_employee
    when 2
      interface.list_employees
    when 3
      interface.search_employee_id
    when 4
      interface.search_employee_name
    when 5
      interface.update_employee
    when 6
      interface.delete_employee
    when 7
      puts "Saindo..."
      break
    else
      puts "Opção inválida. Tente novamente."
    end
  end
end

main