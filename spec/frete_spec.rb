require 'frete'

describe Frete, "Popular dados" do
  
  before(:each) do
    @f = Frete.new(:cep => "01156000", :peso => "10", :comprimento => "60", :largura => "60", :altura => "5")
  end
  
  it "posso ler o cep" do
    @f.cep.should == "01156000"
  end
  
  it "posso ler o peso" do
    @f.peso.should == "10"
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

    
  it "posso ler os dados oriundos do correio" do
    @f.uf_nome.should == "São Paulo"
  end
end