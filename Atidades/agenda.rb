agenda = [
    {nome: "Meydson", telefone: "1234-5678"},
    {nome: "Ana", telefone: "9876-5432"},
    {nome: "Carlos", telefone: "4567-8901"},
    {nome: "Beatriz", telefone: "6789-0123"},
    {nome: "Fernanda", telefone: "2345-6789"},
]

puts "Informe o nome da pessoa que deseja buscar: "
nome_busca = gets.chomp

pessoa_encontrada = agenda.find { |pessoa| pessoa[:nome].downcase == nome_busca.downcase }
puts pessoa_encontrada ? "Telefone de #{pessoa_encontrada[:nome]}: #{pessoa_encontrada[:telefone]}" : "Pessoa não encontrada na agenda."