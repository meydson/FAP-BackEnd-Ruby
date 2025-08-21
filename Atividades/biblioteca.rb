@livros = []

def pause
  puts "Pressione Enter para continuar..."
  gets
end

def menu
  puts "=== Biblioteca Ruby ==="
  puts "1. Cadastrar Livro"
  puts "2. Listar livros disponíveis"
  puts "3. Buscar livro por título ou autor"
  puts "4. Emprestar livro"
  puts "5. Devolver livro"
  puts "6. Sair"
  print "Escolha uma opção: "
  gets.chomp.to_i
end

def cadastrar_livro(livros)
  print "Digite o título do livro: "
  titulo = gets.chomp
  print "Digite o autor do livro: "
  autor = gets.chomp
  puts "Digite o ano de publicação do livro: "
  ano = gets.chomp.to_i
  @livros << { titulo: titulo, autor: autor, ano: ano, status: 'disponível' }
  puts "Livro '#{titulo}' cadastrado com sucesso!"
end

def listar_livros(livros)
  if livros.empty?
    puts "Nenhum livro cadastrado."
  else
    puts "Livros disponíveis:"
    @livros.each_with_index do |livro, index|
        if livro[:status] == 'disponível'
            puts "#{index + 1}. Título: #{livro[:titulo]} | Autor: #{livro[:autor]} | Ano: (#{livro[:ano]})"
        end
    end
   end
   puts "__________________________________________________________"
   pause
end

def buscar_livro(livros)
  print "Digite o título do livro ou autor que deseja buscar: "
  titulo = gets.chomp.downcase
  resultado = livros.select { |livro| livro[:titulo].downcase.include?(titulo) }
  resultado += livros.select { |livro| livro[:autor].downcase.include?(titulo) }
  resultado.uniq! { |livro| livro[:titulo].downcase }
  if resultado.empty?
    puts "Nenhum livro encontrado com o título '#{titulo}'."
  else
    puts "Livros encontrados:"
    resultado.each do |livro|
      puts "Título: #{livro[:titulo]} | Autor: #{livro[:autor]} | Ano: (#{livro[:ano]}) | Status: #{livro[:status]}"
    end
    puts "__________________________________________________________"
    pause
  end
end

def emprestar_livro(livros)
  print "Digite o título do livro que deseja emprestar: "
  titulo = gets.chomp.downcase
  livro = livros.find { |l| l[:titulo].downcase == titulo && l[:status] == 'disponível' }
  
  if livro
    livro[:status] = 'emprestado'
    puts "Livro '#{livro[:titulo]}' emprestado com sucesso!"
    puts "__________________________________________"
    pause
  else
    puts "Livro não encontrado ou já está emprestado."
    puts "__________________________________________"
    pause
  end
end

def devolver_livro(livros)
  print "Digite o título do livro que deseja devolver: "
  titulo = gets.chomp.downcase
  livro = livros.find { |l| l[:titulo].downcase == titulo && l[:status] == 'emprestado' }
  
  if livro
    livro[:status] = 'disponível'
    puts "Livro '#{livro[:titulo]}' devolvido com sucesso!"
    puts "__________________________________________"
    pause
  else
    puts "Livro não encontrado ou não está emprestado."
    puts "_________________________"
    pause
  end
end

def main
    loop do
        case menu
        when 1
        cadastrar_livro(@livros)
        when 2
        listar_livros(@livros)
        when 3
        buscar_livro(@livros)
        when 4
        emprestar_livro(@livros)
        when 5
        devolver_livro(@livros)
        when 6
        puts "Saindo da Biblioteca Ruby. Até logo!"
        break
        else
        puts "Opção inválida. Tente novamente."
        end
    end
end

main