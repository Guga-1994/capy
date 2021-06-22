describe "login 3", :login3 do

        before(:each) do
            visit "/access"  
        end

    it  'login com  sucesso' do
        
        #Uso da ideia de escopo usado no capybara, onde posso restringir ações
        # e interagir com pedaços do HTML (usar eventos de click, prencher cam-
        #pos, obter informação de um label) dentro de uma área especifica da pá-
        #gina, isso foi necessário pq alem da página ter id dinâmico, também tem
        #o atributo 'name' repetido em mais de um padaço da página e isso confunde
        #o capybara que não sabe qual usar, quando restringe a área com a ideia 
        #de escopo, podemos pegar o atributo que queremos delimitando o escopo.
       within("#login") do
        
       #no parâmetro do imput é usado uma query, método do css selector, passando
       #o tipo de campo "input", passando o nome do atributo "name" e o valor do 
       #atributo "username"/"password"
        find('input[name=username]').set 'stark'  
        find('input[name=password]').set 'jarvis!'  
        click_button 'Entrar' 
       end

       
       expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
      #outras formas de usar o código:
      #expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
      #expect(find('#flash')).to eql 'Olá, Tony Stark. Você acessou a área logada!'
    end 

    it  'cadastro com  sucesso' do
        
        
       within("#signup") do
        find('input[name=username]').set 'gustavo'  
        find('input[name=password]').set '123456'  
        #na página, apesar dele parecer com um botão, na verdade ele é um link 
        #so ta com html modificado para parecer um botão, logo tem que usar o 
        #método 'click.link'
        click_link 'Criar Conta' 
       end

       
       expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
      #outras formas de usar o código:
      #expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
      #expect(find('#flash')).to eql 'Olá, Tony Stark. Você acessou a área logada!'
      sleep 3
    end 
end