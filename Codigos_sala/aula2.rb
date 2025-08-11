valor_gerado = rand(10)

puts "Adivinhe o valor de 0 à 10"
valor = gets.chomp.to_i

while valor_gerado != valor
  if valor_gerado > valor
    puts "Você errou, o número secreto é maior que o valor informado!"
  else
    puts "Você errou!, o número secreto é menor que o valor informado!"
  end
  puts "Informe um novo valor!"
  valor = gets.chomp.to_i
end

puts "Você acertou!"