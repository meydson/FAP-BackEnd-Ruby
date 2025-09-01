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

  def transferir(valor, conta_destino)
    validacao = validar_saldo(valor, @saldo)
    if validacao
      @saldo -= valor
      conta_destino.saldo += valor
      puts "Transferência de R$#{'%.2f' % valor} para a conta #{conta_destino.conta} realizada com sucesso."
    else
      puts "Saldo insuficiente ou valor inválido para transferência."
    end
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

conta1 = ContaBancaria.new(1, "João Silva", 1000.0)
conta2 = ContaBancaria.new(2, "Renato Machado", 1000.0)
puts conta1.conta
puts conta1.titular
puts conta1.exibir_saldo
conta1.depositar(500.0)
conta1.sacar(200.0)
conta1.exibir_saldo
conta1.sacar(2000.0)
conta1.depositar(-100.0)
conta1.exibir_saldo
conta1.transferir(300.0, conta2)
conta1.exibir_saldo
conta2.exibir_saldo