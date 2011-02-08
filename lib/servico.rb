class Servico

  def initialize(options = {})
    self.codigo = options[:codigo]
    self.valor = options[:valor]
    self.prazo_entrega = options[:prazo_entrega]
    self.valor_mao_de_obra = options[:valor_mao_de_obra]
    self.valor_aviso_recebimento = options[:valor_aviso_recebimento]
    self.valor_declarado = options[:valor_declarado]
    self.entrega_domiciliar = options[:entrega_domiciliar]
    self.entrega_sabado = options[:entrega_sabado]
    self.erro = options[:erro]
    self.messagem_erro = options[:messagem_erro]
  end
  
  def codigo=(c)
    @codigo=c
  end
  
  def codigo
    @codigo
  end
  
  def valor=(v)
    @valor=v
  end
  
  def valor
    @valor
  end
  
  def prazo_entrega=(pe)
    @prazo_entrega=pe
  end
  
  def prazo_entrega
    @prazo_entrega
  end
  
  def valor_mao_de_obra=(vmo)
    @valor_mao_de_obra=vmo
  end

  def valor_mao_de_obra
    @valor_mao_de_obra
  end
  
  def valor_aviso_recebimento=(v)
    @valor_aviso_recebimento=v
  end
  
  def valor_aviso_recebimento
    @valor_aviso_recebimento
  end

  def valor_declarado=(v)
    @valor_declarado=v
  end

  def valor_declarado
    @valor_declarado
  end
  
  def entrega_domiciliar=(ed)
    @entrega_domiciliar=ed
  end
  
  def entrega_domiciliar
    @entrega_domiciliar
  end

  def entrega_sabado=(es)
    @entrega_sabado=es
  end

  def entrega_sabado
    @entrega_sabado
  end
  
  def to_xml
    xml = "<?xml version='1.0' encoding='UTF-8'?>"
    xml += "<servico>"
    xml += "<codigo>#{self.codigo}</codigo>"
    xml += "<valor>#{self.valor}</valor>"
    xml += "<prazo_entrega>#{self.prazo_entrega}</prazo_entrega>"
    xml += "<valor_mao_de_obra>#{self.valor_mao_de_obra}</valor_mao_de_obra>"
    xml += "<valor_aviso_recebimento>#{self.valor_aviso_recebimento}</valor_aviso_recebimento>"
    xml += "<valor_declarado>#{self.valor_declarado}</valor_declarado>"
    xml += "<entrega_domiciliar>#{self.entrega_domiciliar}</entrega_domiciliar>"
    xml += "<entrega_sabado>#{self.entrega_sabado}</entrega_sabado>"
    xml += "</servico>"
  end
  
  private
  def messagem_erro=(me)
    @messagem_erro=me
  end
  
  def messagem_erro
    @messagem_erro
  end
  
  def erro=(e)
    @erro = e
  end
  
  def erro
    @erro
  end
end