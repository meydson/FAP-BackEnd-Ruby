valor = []
total = 0
produto_caro = 0
produto_barato = 0

until valor.last == 0 do
  puts "Informe o valor do produto ou digite 0 para finalizar:"
  valor << gets.chomp.to_f.round(2)
end

valor.pop
produto_caro = valor[0]
produto_barato = valor[0]


for i in 0...valor.size do
  total += valor[i]
  if produto_caro < valor[i]
    produto_caro = valor[i]
  end
  if produto_barato > valor[i]
    produto_barato = valor[i]
  end
end

puts "Produto mais caro: R$ #{produto_caro.round(2)}"
puts "Produto mais barato: R$ #{produto_barato.round(2)}"
puts "Valor total da lista: R$ #{total.round(2)}"