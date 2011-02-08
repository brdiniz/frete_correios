class Frete
  require "rexml/document"
  require "open-uri"
  require "servico"
  include REXML
  
  def initialize(options = {})
    # 41106  PAC sem contrato
    # 40010  SEDEX sem contrato
    # 40215  SEDEX 10, sem contrato
    # 40290  SEDEX Hoje, sem contrato
    self.codigo_empresa = options[:codigo_empresa]
    self.senha_empresa = options[:senha_empresa]
    self.codigo_servico = options[:codigo_servico]
    self.cep_origem = options[:cep_origem]
    self.cep_destino = options[:cep_destino]
    self.peso = options[:peso]
    self.codigo_formato = options[:codigo_formato]
    self.comprimento = options[:comprimento]
    self.altura = options[:altura]
    self.largura = options[:largura]
    self.codigo_mao_de_obra = options[:codigo_mao_de_obra]
    self.diametro = options[:diametro]
    self.valor_declarado = options[:valor_declarado]
    self.codigo_aviso_recebimento = options[:codigo_aviso_recebimento]
  end
  
  def codigo_mao_de_obra
    @codigo_mao_de_obra
  end
  
  def codigo_mao_de_obra=(cmo)
    @codigo_mao_de_obra=cmo
  end
  
  def diametro=(d)
    @diametro=d
  end
  
  def diametro
    return @diametro
  end
  
  def valor_declarado=(v)
    @valor_declarado=v
  end
  
  def valor_declarado
    return @valor_declarado
  end
  
  def codigo_aviso_recebimento=(cav)
    @codigo_aviso_recebimento=cav
  end
  
  def codigo_aviso_recebimento
    return @codigo_aviso_recebimento
  end
  
  def codigo_empresa=(c)
    @codigo_empresa=c
  end
  
  def codigo_empresa
    return @codigo_empresa
  end
  
  def senha_empresa=(c)
    @senha_empresa=c
  end
  
  def senha_empresa
    return @senha_empresa
  end
  
  def codigo_servico=(c)
    @codigo_servico=c
  end
  
  def codigo_servico
    return @codigo_servico
  end
  
  def cep_origem=(co)
    @cep_origem = co
  end
  
  def cep_origem
    return @cep_origem
  end

  def cep_destino=(co)
    @cep_destino = co
  end

  def cep_destino
    return @cep_destino
  end

  def codigo_formato=(c)
    @codigo_formato=c
  end
  
  def codigo_formato
    return @codigo_formato
  end
  
  def cep=(c)
    @cep = c
  end
  
  def cep
    return @cep
  end

  def peso
    return @peso
  end

  def peso=(c)
    @peso = c
  end

  def comprimento
    return @comprimento
  end

  def comprimento=(c)
    @comprimento = c
  end

  def altura
    return @altura
  end

  def altura=(c)
    @altura = c
  end
  
  def largura=(l)
    @largura = l
  end

  def largura
    return @largura
  end
  
  def servicos
    @servicos = find
  end
  
  def find
    uri = "http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?"
    uri = uri + "nCdEmpresa=" + @codigo_empresa
    uri = uri + "&sDsSenha=" + @senha_empresa
    uri = uri + "&sCepOrigem=" + @cep_origem
    uri = uri + "&sCepDestino=" + @cep_destino
    uri = uri + "&nVlPeso=" + @peso
    uri = uri + "&nCdFormato=" + @codigo_formato
    uri = uri + "&nVlComprimento=" + @comprimento
    uri = uri + "&nVlAltura=" + @altura
    uri = uri + "&nVlLargura=" + @largura
    uri = uri + "&sCdMaoPropria=s"
    uri = uri + "&nVlValorDeclarado=" + @valor_declarado
    uri = uri + "&sCdAvisoRecebimento=" + @codigo_aviso_recebimento
    uri = uri + "&nCdServico=" + @codigo_servico
    uri = uri + "&nVlDiametro=" + @diametro
    uri = uri + "&StrRetorno=xml"
    
    source = open(uri).read
    xml = Document.new(source).root
    
    list = []
    
    xml.elements.each("//Servicos/cServico") do |frete|
      
      s = Servico.new(
        :codigo => frete.elements["Codigo"].text,
        :valor => frete.elements["Valor"].text,
        :prazo_entrega => frete.elements["PrazoEntrega"].text,
        :valor_mao_de_obra => frete.elements["ValorMaoPropria"].text,
        :valor_aviso_recebimento => frete.elements["ValorAvisoRecebimento"].text,
        :valor_declarado => frete.elements["ValorValorDeclarado"].text,
        :entrega_domiciliar => frete.elements["EntregaDomiciliar"].text,
        :entrega_sabado => frete.elements["EntregaSabado"].text,
        :erro => frete.elements["Erro"].text,
        :messagem_erro => frete.elements["MsgErro"].text)
        
      list << s
    end
    
    return list
  end
end