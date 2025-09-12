puts "Digite o tamanho da sua matriz quadratica"
tamanho = gets.to_i
system("clear")

# Aqui está printando as linhas
tamanho.times do |i|
  # Aqui está pritando as colunas
  tamanho.times do |j|
    print "#{[j+1, i+1,tamanho - j,tamanho - i].min} "
  end

  puts
end

puts
puts "Digite enter pra sair"
gets