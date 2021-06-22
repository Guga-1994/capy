describe "login 2", :login2 do

        before(:each) do
            visit "/login2"  
        end

    it  'com data de nascimento' do
        
       # fill_in 'username', with: 'stark'
       # fill_in 'password', with: 'jarvis!'

       find('#userId').set "stark"
       find('#passId').set "jarvis!"
       
       #com o find, encontra o login do formulário
       login_form = find("#login")
 
       #como o campo de data de nascimento é dinâmico e fica
       #mudando entre dia, mês e ano, é feito um case para 
       #buscar na variável login_form qual informação esta 
       #sendo solicitadas
       case login_form.text

       when /Dia/
        find("#day").set '29'

       when /Mês/
        find("#month").set '05'

       when /Ano/
        find("#year").set '1970'

       end

      click_button 'Login'
       
       expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
      #outras formas de usar o código:
      #expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
      #expect(find('#flash')).to eql 'Olá, Tony Stark. Você acessou a área logada!'
    end 
end