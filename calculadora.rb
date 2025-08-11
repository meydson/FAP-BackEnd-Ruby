def numeros_usuario (text)
    puts text
    numero = gets.chomp.to_f
end

numeros = []
puts "Quantos números você quer calcular?"
qtd_numeros = gets.chomp.to_i

(0...qtd_numeros).each do |i|
    numeros << numeros_usuario("Digite um número:")
end

puts "Qual operação você quer fazer? (soma, subtração, multiplicação, divisão)"
operacao = gets.chomp.downcase.tr('áàãâä', 'a').tr('éèêë', 'e').tr('íìîï', 'i').tr('óòõôö', 'o').tr('úùûü', 'u')

numeros.map!(&:to_f)

case operacao
when "soma"
  resultado = 0.0
  for n in numeros
    resultado += n
  end
  puts "Soma: #{format('%.2f', resultado)}"

when "subtração", "subtracao"
  resultado = numeros[0]
  for i in 1...numeros.size
    resultado -= numeros[i]
  end
  puts "Subtração: #{format('%.2f', resultado)}"

when "multiplicação", "multiplicacao"
  resultado = 1.0
  for n in numeros
    resultado *= n
  end
  puts "Multiplicação: #{format('%.2f', resultado)}"

when "divisão", "divisao"
  if numeros[1..-1].any? { |n| n == 0 }
    puts "Divisão: Não é possível dividir por zero."
  else
    resultado = numeros[0]
    for i in 1...numeros.size
      resultado /= numeros[i]
    end
    puts "Divisão: #{format('%.2f', resultado)}"
  end

else
  puts "Operação inválida."
end
