class Frete
  require "rexml/document"
  require "open-uri"
  include REXML
  
  def initialize(options = {})
    self.cep = options[:cep]
    self.peso = options[:peso]
    self.comprimento = options[:comprimento]
    self.largura = options[:largura]
    self.altura = options[:altura]
    self.uf_nome = ""
    find
  end
  
  def uf_nome=(u)
    @uf_nome = u
  end
  
  def uf_nome
    return @uf_nome
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
  
  def uf_nome
    return @uf_nome
  end
  
  private
  def uf_nome=(u)
    @uf_nome = u
  end
  
  def find
    uri = "http://frete.w21studio.com/calFrete.xml?cep=#{self.cep}&cod=5112&peso=#{self.peso}&comprimento=#{self.comprimento}&largura=#{self.largura}&altura=#{self.altura}&servico=3"
    
    source = open(uri).read
    xml = Document.new(source).root
    
    xml.elements.each("//frete") do |frete|
      self.uf_nome = frete.elements["uf_nome"].text
    end
  end
end