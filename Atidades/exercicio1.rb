def numeros_usuario (text)
    puts text
    numero = gets.chomp.to_f
end

def operacoes_matematicas(num1, num2)
    puts "Soma: #{format('%.2f',(num1 + num2))}"
    puts "Subtração: #{format('%.2f',(num1 - num2))}"
    puts "Multiplicação: #{format('%.2f',(num1 * num2))}"
    if num2 == 0
        puts "Divisão: Não é possível dividir por zero."
    else
        puts "Divisão: #{format('%.2f',(num1 / num2))}"
    end
end

numero1 = numeros_usuario("Digite o primeiro número:")
numero2 = numeros_usuario("Digite o segundo número:")

operacoes_matematicas(numero1, numero2)