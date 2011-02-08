require 'servico'

describe Servico do
  
  before(:each) do
    @s = Servico.new(:codigo => "41106",
    :valor => "10,00",
    :prazo_entrega => "3,50",
    :valor_mao_de_obra => "1,32",
    :valor_aviso_recebimento => "1,50",
    :valor_declarado => "100,00",
    :entrega_domiciliar => "S",
    :entrega_sabado => "S",
    :erro => "0",
    :messagem_erro => "Sem erro")
  end
  
  it "posso ler o retorno do codigo" do
    @s.codigo.should == "41106"
  end

  it "posso ler o retorno do valor" do
    @s.valor.should == "10,00"
  end

  it "posso ler o retorno do prazo_entrega" do
    @s.prazo_entrega.should == "3,50"
  end

  it "posso ler o retorno do valor_mao_de_obra" do
    @s.valor_mao_de_obra.should == "1,32"
  end
  
  it "posso ler o retorno do valor_aviso_recebimento" do
    @s.valor_aviso_recebimento.should == "1,50"
  end

  it "posso ler o retorno do valor_declarado" do
    @s.valor_declarado.should == "100,00"
  end

  it "posso ler o retorno do entrega_domiciliar" do
    @s.entrega_domiciliar.should == "S"
  end

  it "posso ler o retorno do entrega_sabado" do
    @s.entrega_sabado.should == "S"
  end
end