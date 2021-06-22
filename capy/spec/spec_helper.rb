require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Capybara::DSL
  
  #esse comando usando o 'before' define a resolução de tela que meu teste vai
  #trabalhar. Quando não definimos, o 'webdriver do chrome' define uma resolução
  #padrão. Ao testar nossos softwares temos o costume de maximizar a tela, pois 
  #teremos uma visão melhor dos compontes da tela, podemos querer testar usando
  #resolução 'full hd' ou até mesmo '4k'. Porém temos que nos atentar que talvez o 
  #cliente que vai fazer a validação do produto tenha apenas a disposição um
  #dispositivo com uma resolução mais baixa, logo corre-se o risco de termos pro-
  #blemas com a resolução. O recomendável é descobrir a resolução mínima que o 
  #software trabalha e rodar os scripts de teste nessa resolução. No before
  #colocamos uma resolução básica, bem comum em  notebooks 1280x800
  config.before(:example) do
    page.current_window.resize_to(1280, 800)
  end
  
  #através do recurso de screenshot 'save.screenshot' podemos salvar um print da tela
  #e guardamos na pasta save "page.save_screenshot('log/login_com_sucesso.png')"
  #a parâmetro "e" recebe o nome dos cenários de testes, mas para pegar os nomes
  #mesmo com caracteres especiais,usa-se o recuso do ruby chamado ".description"
  #que vai retornar o nome certinho dos cenários de teste. Porém podemos notar que
  #o nome dos cenários e teste possuem espaços, e isso não fica legal para nomear
  #nomes de arquivos de "log", que seria interessante ter a separação por underline.
  #para chegarmos a esse resultado podemos usar um recurso do ruby que trabalha com
  #substrings ".gsub()" e será usado uma ajax(expressão regular), "(/^A-Za-z0-9]/,'')"
  #que substitui caractere especial por nada. E por fim é usado o recurso "tr" que su-
  #bstitui os espaços em branco por underlines
  config.after(:example) do |e|
      nome = e.description.gsub(/[^A-Za-z0-9 ]/,'').tr(' ', '_')
      #o método '.exception' mostra a descrição da falha de um teste
      #nesse caso foi usado um 'if' compacto, que faz o comando na
      #linha do "if" ser executado se o if for verdadeiro, ou se 
      # se "e.exception" encontrar alguma falha nos testes, e ai sim
      #vai ser tirado o print, apenas dos testes que falharam 
      #if (e.exception)
        page.save_screenshot('log/' + nome + '.png')
      #end
  end

end


#faz com que o projeto do capybara seja executado pelo google chrome
Capybara.configure do |config|

  #habilita o programa do navegador paras fazer a conexão entre o código
  #e o navegador habilitado, para poder fazer as automações nas páginas 
  #web. Caso fosse usar no firefox bastaria deixar apenas o nome "selenium"
  config.default_driver = :selenium_chrome
  
  #nessa tipo de teste usando "headless" é possivel executar os testes sem 
  #usar o navegador, deixando o navegador invisível. Para fins de automação
  #de testes é bem interessante, pois necessariamente não precisa ter o nave-
  #gador para os testes rodarem, uma vez que todos nos scripts estão implemen-
  #tados e funcionando. É interessante pq pode rodar a automação dentro de um 
  #servidor CI(Continuos Integration), e pode ser que esse servidor seja um 
  #ambiente linux que nem tem uma interface visual. Nesse formato o chrome é
  #aberto porém de modo invisível.
  #config.default_driver = :selenium_chrome_headless

  
  #configuração para deixar o tempo de execução de cada caso de teste
  #como padrão de 5 minutos 
  config.default_max_wait_time = 5

  #essa configuração serve para determinar a url padrão do sistema,
  #para não precisar ficar colocando no método "visit" em cada teste
  #além de quê, se a url mudar, terá que ser feito a alteraçãp em 
  #todos os arquivos de teste. No caso, os arquivos de teste terão
  #apenas as rotas para cada página ex: visit '/login'. 
  config.app_host = 'https://training-wheels-protocol.herokuapp.com' 
end
