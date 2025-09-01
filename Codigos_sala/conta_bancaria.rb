class ContaBancaria
  attr_accessor :titular, :conta, :saldo
  # Caso deseje que um atributo seja somente leitura, utilize attr_reader
  # Caso deseje que um atributo seja somente escrita, utilize attr_writer

  def initialize(conta, titular, saldo_inicial)
    @conta = conta
    @titular = titular
    @saldo = saldo_inicial
  end
  
  
  def depositar(valor)
    if valor > 0
      @saldo += valor
      puts "Depósito de R$#{'%.2f' % valor} realizado com sucesso."
    else
      puts "Valor de depósito inválido."
    end
  end
  
  def sacar(valor)
    validacao = validar_saldo(valor, @saldo)
    if validacao
      @saldo -= valor
      puts "Saque de R$#{'%.2f' % valor} realizado com sucesso."
    else
      puts "Saldo insuficiente ou valor inválido."
    end
  end
  
  def exibir_saldo
    puts "Saldo atual: R$#{'%.2f' % @saldo}"
  end
  
  private
  def validar_saldo(valor, saldo_atual)
    if valor <= @saldo && valor > 0
      return true
    else
      return false
    end
  end
end

conta = ContaBancaria.new("12345-6", "João Silva", 1000.0)
puts conta.conta
puts conta.titular
puts conta.exibir_saldo
conta.depositar(500.0)
conta.sacar(200.0)
conta.exibir_saldo
conta.sacar(2000.0)
conta.depositar(-100.0)
conta.exibir_saldo