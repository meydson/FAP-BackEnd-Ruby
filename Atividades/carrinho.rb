carrinho = []
item = "vazia"
valor = 0.0
total = 0.0

def adicionar_item(carrinho, item, valor)
  carrinho << { item: item, valor: valor }
end

def interacao_usuario(carrinho)
  loop do
    puts "Digite o nome do item (ou 'sair' para finalizar):"
    item = gets.chomp
    break if item.downcase == 'sair'

    puts "Digite o valor do item:"
    valor = gets.chomp.to_f

    adicionar_item(carrinho, item, valor)
    puts "Item adicionado: #{item} - R$ #{valor}"
  end
end

interacao_usuario(carrinho)

puts "Carrinho de Compras"
puts carrinho.empty? ? "Seu carrinho está vazio." : "Itens no carrinho:"
carrinho.each do |item|
  puts "#{item[:item]} - R$ #{item[:valor].round(2)}"
  total += item[:valor]
end
puts "Total: R$ #{total.round(2)}"