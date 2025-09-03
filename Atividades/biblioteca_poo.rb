class Livro
  attr_accessor :titulo, :autor, :ano, :status

  def initialize(titulo, autor, ano, status = 'disponível')
    @titulo = titulo
    @autor = autor
    @ano = ano
    @status = status
  end

  
end

class Biblioteca
  attr_accessor :livros, :nome
  
  def initialize(nome, livros = [])
    @nome = nome
    @livros = livros
  end
  
  def cadastrar_livro
    print "Digite o título do livro: "
    titulo = gets.chomp
    print "Digite o autor do livro: "
    autor = gets.chomp
    puts "Digite o ano de publicação do livro: "
    ano = gets.chomp.to_i
    self.livros << Livros.new(titulo, autor, ano)
    puts "Livro '#{titulo}' cadastrado com sucesso!"
    puts "Aperte enter para continuar!"
    gets
    system "clear"
  end

  def listar_livros(livros = self.livros)
    livros.each do |livro|
      puts "Título: #{livro.titulo} | Autor: #{livro.autor} | Ano: #{livro.ano} | Status: #{livro.status}"
    end
  end

  def buscar_livro
    print "Digite o título do livro ou autor que deseja buscar: "
    inp_user = gets.chomp.downcase
    #filtrar livros por status
    resultado = self.livros.select { |livro| livro[:titulo].downcase.include?(inp_user) }
    resultado += self.livros.select { |livro| livro[:autor].downcase.include?(inp_user) }
    resultado.uniq! { |livro| livro[:titulo].downcase }
    if resultado.empty?
      puts "Nenhum livro encontrado com o título ou autor: '#{inp_user}'."
    else
      puts "Livros encontrados:"
      self.listar_livros(resultado)
      puts "__________________________________________________________"
    end
  end

  def emprestar_livro
    print "Digite o título do livro que deseja emprestar: "
    titulo = gets.chomp.downcase
    livro = self.livros.find { |l| l.titulo.downcase == titulo && l.status == 'disponível' }

    if livro
      livro.status = 'emprestado'
      puts "Livro '#{livro.titulo}' emprestado com sucesso!"
      puts "__________________________________________"
      pause
    else
      puts "Livro não encontrado ou já está emprestado."
      puts "__________________________________________"
      pause
    end
  end

  def devolver_livro
    print "Digite o título do livro que deseja devolver: "
    titulo = gets.chomp.downcase
    livro = self.livros.find { |l| l.titulo.downcase == titulo && l.status == 'emprestado' }

    if livro
      livro.status = 'disponível'
      puts "Livro '#{livro.titulo}' devolvido com sucesso!"
      puts "__________________________________________"
      pause
    else
      puts "Livro não encontrado ou não está emprestado."
      puts "_________________________"
      pause
    end
  end

  def remover_livro
    print "Digite o título do livro que deseja remover: "
    titulo = gets.chomp.downcase
    livro = self.livros.find { |l| l.titulo.downcase == titulo }

    if livro
      self.livros.delete(livro)
      puts "Livro '#{livro.titulo}' removido com sucesso!"
      puts "__________________________________________"
      pause
    else
      puts "Livro não encontrado."
      puts "_________________________"
      pause
    end
  end
end

def pause
  puts "Pressione Enter para continuar..."
  gets
end

def menu_geral
  puts "==================================="
  puts "Bem-vindo à Biblioteca Ruby!"
  puts "==================================="
  puts "1. Acessar uma Biblioteca"
  puts "2. Criar Biblioteca"
  print "Escolha uma opção: "
  gets.chomp.to_i
end
  
def menu_biblioteca
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



# def listar_livros(livros)
#   contador = 1
#   if livros.empty?
#     puts "Nenhum livro cadastrado."
#   else
#     puts "Livros disponíveis:"
#     livros.each_with_index do |livro|
#         if livro[:status] == 'disponível'
#           puts "#{contador}. Título: #{livro[:titulo]} | Autor: #{livro[:autor]} | Ano: (#{livro[:ano]})"
#           contador += 1
#         end
#     end
#    end
#    puts "__________________________________________________________"
#    pause
# end

@bibliotecas = [Biblioteca.new("Biblioteca Central",@livros = [Livro.new("Eu, Robo", "Isaac Asimov", 1980)]), Biblioteca.new("Biblioteca do Bairro", @livros = [])]


def main
  loop do
    menu = menu_geral
    case menu
    when 1
      if @bibliotecas.nil?
        puts "Nenhuma biblioteca encontrada. Por favor, crie uma nova biblioteca."
        puts "__________________________________________"
        pause
        system "clear"
      else
        puts "Bibliotecas disponíveis:"
        @bibliotecas.each_with_index do |biblioteca, index|
          puts "#{index + 1}. #{biblioteca.nome}"
        end
        print "Escolha uma biblioteca pelo número (ou 0 para voltar): "
        escolha = gets.chomp.to_i
        if escolha == 0
          system "clear"
          next
        elsif escolha < 1 || escolha > @bibliotecas.length
          puts "Opção inválida. Tente novamente."
          puts "_________________________________"
          pause
          system "clear"
          next
        end
        @biblioteca = @bibliotecas[escolha - 1]
        puts "Você entrou na biblioteca '#{@biblioteca.nome}'."
        puts "__________________________________________"
        main_biblioteca(@biblioteca)
        pause
        system "clear"
      
      end
    when 2
      print "Digite o nome da nova biblioteca: "
      @biblioteca_nome = gets.chomp
      @biblioteca = Biblioteca.new(@biblioteca_nome)
      puts "Biblioteca '#{@biblioteca_nome}' criada com sucesso!"
      puts "__________________________________________"
      pause
      system "clear"
      @bibliotecas << @biblioteca
    else
      puts "Opção inválida. Tente novamente."
      puts "_________________________________"
      pause
      system "clear"
    end
  end
end

def main_biblioteca(biblioteca)
  puts "Você entrou na biblioteca '#{biblioteca.nome}'."
  loop do
    case menu_biblioteca
    when 1
      biblioteca.cadastrar_livro
    when 2
      biblioteca.listar_livros
    when 3
      bibliteca.buscar_livro
    when 4
      biblioteca.emprestar_livro
    when 5
      biblioteca.devolver_livro
    when 6
      biblioteca.remover_livro
    when 7
      puts "Saindo da Biblioteca #{biblioteca.nome}. Até logo!"
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

