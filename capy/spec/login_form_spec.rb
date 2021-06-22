describe "Forms", :login_form do
    it  'login com sucesso' do
        #Esse teste será feito numa página de login, logo teremos que preencher
        #os campos de login e senha. O visit direcionará para a página 
        # e o comando "fill_in" indica qual a variavel deverá ser preenchida, 
        #essa variável a pessoa encontrará ao inspecionar o item na página, ela
        #pode pegar as variável do tipo name="username" ou id="userId"
        visit "/login"
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'
        #O comando find vai tentar procurar esse valor 
        #de variável  no codigo html, no caso, o flash
        #esta representando a mensagem de sucesso ao 
        #logar o usuário, logo se ele for encontrado quer
        #dizer que a ação de login ocorreu como esperado
        expect(find('#flash').visible?).to be true
        #Vai dar errado porque o eql vai comprar ambas as strings
        #porem quando a mensagem vai ser copiada la na pagina acaba
        #trazendo tbem o simbolo "x" que indica opção de fechar a 
        #página. logo o eql não serve para essa verificação.
        #expect(find('#flash').text).to eql 'Olá, Tony Stark. Você acessou a área logada!'

        #Nesse caso foi usado o recurso do ruby, o include
        #expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        #Aqui temos uma opção do capybara, o have_content, deixa o codigo mais limpo.
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end 

    it 'senha incorreta', :temp do 
        visit '/login'

        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'xpto123'
        click_button 'Login'

        expect(find('#flash')).to have_content 'Senha é invalida!'
    end

    it 'usuário não cadastrado' do
        visit '/login'

        fill_in 'username', with: 'hulk'
        fill_in 'password', with: 'xpto123'
        click_button 'Login'

        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'

    end
end
