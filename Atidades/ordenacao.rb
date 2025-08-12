array_ordenado = []

[2, 10, 5, 30, 40].each do |numero|
  posicao = array_ordenado.index { |x| x > numero } || array_ordenado.size
  array_ordenado.insert(posicao, numero)
end

puts "Array original: [2, 10, 5, 30, 40]"
puts "Array ordenado: #{array_ordenado}"
