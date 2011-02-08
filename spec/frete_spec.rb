require 'frete'

describe Frete do
  
  before(:each) do
    @f = Frete.new(:codigo_empresa => "",
    :senha_empresa => "",
    :codigo_servico => "41106,40010,40215,40290",
    :cep_origem => "01123001",
    :cep_destino => "01156040",   
    :peso => "10,00",
    :codigo_formato => "1",  
    :comprimento => "60", 
    :altura => "5",
    :largura => "60",
    :diametro => "0",
    :codigo_mao_de_obra => "s",
    :valor_declarado => "1500",
    :codigo_aviso_recebimento => "S")
  end
  
  it "posso ler o codigo da empresa" do
    @f.codigo_empresa.should == ""
  end
  
  it "posso ler o senda da empresa" do
    @f.senha_empresa.should == ""
  end
  
  it "posso ler o codigo do servico" do
    @f.codigo_servico.should == "41106,40010,40215,40290"
  end
  
  it "posso ler o cep de origem" do
    @f.cep_origem.should == "01123001"
  end
  
  it "posso ler o cep de destino" do
    @f.cep_destino.should == "01156040"
  end
  
  it "posso ler o peso" do
    @f.peso.should == "10,00"
  end
  
  it "posso ler codigo formato" do
    @f.codigo_formato.should == "1"
  end

  it "posso ler o comprimento" do
    @f.comprimento.should == "60"
  end

  it "posso ler a altura" do
    @f.altura.should == "5"
  end

  it "posso ler a largura" do
    @f.largura.should == "60"
  end
  
  it "posso ler o diametro" do
    @f.diametro.should == "0"
  end
  
  it "posso ler o codigo_mao_de_obra" do
    @f.codigo_mao_de_obra.should == "s"
  end
  
  it "posso ler o codigo do valor declarado" do
    @f.valor_declarado.should == "1500"
  end
  
  it "posso ler o codigo_aviso_recebimento" do
    @f.codigo_aviso_recebimento.should == "S"
  end
  
  it "posso ler os dados oriundos do correio" do
    @f.servicos.size.should == 4
  end
  
  it "posso ler o primeiro servico com o codigo igual a 41106" do
    @f.servicos.first.codigo.should == "41106"
  end
  
  it "posso ler a lista de servicos gerados pelo frete" do
    servicos = @f.servicos
    
    json = "["
    json += servicos[0].to_json + ","
    json += servicos[1].to_json + ","
    json += servicos[2].to_json + ","
    json += servicos[3].to_json
    json += "]"

    @f.servicos_to_json.should == json
  end
end