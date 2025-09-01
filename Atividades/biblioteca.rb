@livros = [
  { titulo: 'O Senhor dos Anéis', autor: 'J.R.R. Tolkien', ano: 1954, status: 'disponível' },
  { titulo: '1984', autor: 'George Orwell', ano: 1949, status: 'disponível' },
  { titulo: 'Dom Casmurro', autor: 'Machado de Assis', ano: 1899, status: 'disponível' },
  { titulo: 'A Revolução dos Bichos', autor: 'George Orwell', ano: 1945, status: 'disponível' },
  { titulo: 'Eu, Robô', autor: 'Isaac Asimov', ano: 1950, status: 'disponível' },
]

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
  puts "6. Remover livro"
  puts "7. Sair"
  print "Escolha uma opção: "
  gets.chomp.to_i
end

def cadastrar_livro
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
  contador = 1
  if livros.empty?
    puts "Nenhum livro cadastrado."
  else
    puts "Livros disponíveis:"
    livros.each_with_index do |livro|
        if livro[:status] == 'disponível'
          puts "#{contador}. Título: #{livro[:titulo]} | Autor: #{livro[:autor]} | Ano: (#{livro[:ano]})"
          contador += 1
        end
    end
   end
   puts "__________________________________________________________"
   pause
end

def buscar_livro(livros)
  print "Digite o título do livro ou autor que deseja buscar: "
  inp_user = gets.chomp.downcase
  #filtrar livros por status
  resultado = livros.select { |livro| livro[:titulo].downcase.include?(inp_user) }
  resultado += livros.select { |livro| livro[:autor].downcase.include?(inp_user) }
  resultado.uniq! { |livro| livro[:titulo].downcase }
  if resultado.empty?
    puts "Nenhum livro encontrado com o título ou autor: '#{inp_user}'."
  else
    puts "Livros encontrados:"
    listar_livros(resultado)
    puts "__________________________________________________________"
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

def remover_livro(livros)
  print "Digite o título do livro que deseja remover: "
  titulo = gets.chomp.downcase
  livro = livros.find { |l| l[:titulo].downcase == titulo }
  
  if livro
    livros.delete(livro)
    puts "Livro '#{livro[:titulo]}' removido com sucesso!"
    puts "__________________________________________"
    pause
  else
    puts "Livro não encontrado."
    puts "_________________________"
    pause
  end
end

def main
    loop do
        case menu
        when 1
        cadastrar_livro
        when 2
        listar_livros(@livros)
        when 3
        buscar_livro(@livros)
        when 4
        emprestar_livro(@livros)
        when 5
        devolver_livro(@livros)
        when 6
        remover_livro(@livros)
        when 7
        puts "Saindo da Biblioteca Ruby. Até logo!"
        puts "____________________________________"
        pause
        break
        else
        puts "Opção inválida. Tente novamente."
        puts "_________________________________"
        pause
        end
    end
end

main
