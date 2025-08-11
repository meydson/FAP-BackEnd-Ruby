valor = []
total = 0

until valor.last == 0 do
  puts "Informe o valor do produto ou digite 0 para finalizar:"
  valor << gets.chomp.to_f.round(2)
end

valor.pop
produto_caro = valor.max
produto_barato = valor.min
total = valor.sum

puts "Produto mais caro: R$ #{produto_caro.round(2)}"
puts "Produto mais barato: R$ #{produto_barato.round(2)}"
puts "Valor total da lista: R$ #{total.round(2)}"