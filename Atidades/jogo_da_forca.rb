palavras_secreta = ["abacaxi", "banana", "laranja", "manga", "uva", "morango", "kiwi", "cabelereiro", "programador", "python"]

def escolher_palavra(palavras)
  palavras.sample
end

def exibir_forca(tentativas)
  estagios = [
    "  _______\n |/      |\n |      \n |     \n |     \n |     \n |_____\n",
    "  _______\n |/      |\n |      O\n |     \n |     \n |     \n |_____\n",
    "  _______\n |/      |\n |      O\n |      |\n |     \n |     \n |_____\n",
    "  _______\n |/      |\n |      O\n |     /|\n |     \n |     \n |_____\n",
    "  _______\n |/      |\n |      O\n |     /|\\\n |     \n |     \n |_____\n",
    "  _______\n |/      |\n |      O\n |     /|\\\n |     / \n |     \n |_____\n",
    "  _______\n |/      |\n |      O\n |     /|\\\n |     / \\\n |     \n |_____\n"
  ]
  estagios[tentativas]
end

def replay?
  print "Deseja jogar novamente? (s/n): "
  gets.chomp.downcase == 's'
end

def jogo_da_forca(palavras_secreta)
  puts "Bem-vindo ao Jogo da Forca!"
  palavra = escolher_palavra(palavras_secreta)
  letras_adivinhadas = []
  tentativas = 0
  max_tentativas = 6

  while tentativas < max_tentativas
    puts exibir_forca(tentativas)
    puts "Palavra: #{palavra.chars.map { |letra| letras_adivinhadas.include?(letra) ? letra : "_" }.join(" ")}"
    puts "Letras adivinhadas: #{letras_adivinhadas.join(", ")}"
    
    print "Digite uma letra: "
    letra = gets.chomp.downcase
    
    if letra.length != 1 || !letra.match?(/[a-z]/)
      puts "Por favor, digite apenas uma letra válida."
      next
    end

    if letras_adivinhadas.include?(letra)
      puts "Você já adivinhou essa letra!"
      next
    end

    letras_adivinhadas << letra

    if palavra.include?(letra)
      puts "Boa! A letra '#{letra}' está na palavra."
    else
      puts "Ops! A letra '#{letra}' não está na palavra."
      tentativas += 1
    end

    if palavra.chars.all? { |l| letras_adivinhadas.include?(l) }
      puts "Parabéns! Você adivinhou a palavra: #{palavra}."
      return
    end
  end

  puts exibir_forca(tentativas)
  puts "Você perdeu! A palavra era: #{palavra}."
end

loop do
    jogo_da_forca(palavras_secreta)
    break unless replay?
end
puts "Obrigado por jogar o Jogo da Forca!"