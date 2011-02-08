Gem::Specification.new do |s|
  s.name        ="frete_correios"
  s.version     = "0.1"
  s.author      = "Bruno Diniz"
  s.email       = "contato@brdiniz.com"
  s.homepage    = "https://github.com/Brdiniz/frete_correios"
  s.summary     = "Simple gem que retorna os valores de um frete diretamente da base dos correios"
  
  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"] - ["frete_correios.lock"]
  s.require_path = "lib"
end