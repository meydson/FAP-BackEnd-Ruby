def numeros_usuario (text)
    puts text
    numero = gets.chomp.to_f
end

def operacoes_matematicas(num1, num2)
    puts "Soma: #{(num1 + num2).round(2)}"
    puts "Subtração: #{(num1 - num2).round(2)}"
    puts "Multiplicação: #{(num1 * num2).round(2)}"
    if num2 == 0
        puts "Divisão: Não é possível dividir por zero."
    else
        puts "Divisão: #{(num1 / num2).round(2)}"
    end
end

numero1 = numeros_usuario("Digite o primeiro número:")
numero2 = numeros_usuario("Digite o segundo número:")

operacoes_matematicas(numero1, numero2)