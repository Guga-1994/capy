describe "Alertas de Java script", :alerta do

    before(:each) do
        visit '/javascript_alerts'
    end 

    it "alerta", :alert do
        
        #comando que clica no botão de mensagem de alerta
        click_button "Alerta"
        #outro comando possível usando o find é buscando sobre a classe que contem 
        #o componente ex:  find('.btn-success').click, no caso a '.btn-success'


        #o comando page.driver.browser.switch_to.alert.text que é um recurso do seleniun
        #usado no capybara. O driver ta habilitando para se trabalhar no navegador, o 
        #.browser da a possibilidade de trabalhar com o navegador da seção, o .switch_to
        #diz para o selenium que vai ser trabalhado um componente do javascript, que abre
        #uma janela e mostra uma mensagem de alerta, o programa irá achar essa janela pq
        #ja foi feito um evento de click no botão com o comando "click_button 'Alerta'"
        mensagem  = page.driver.browser.switch_to.alert.text

        expect(mensagem).to eql "Isto é uma mensagem de alerta"
        puts mensagem 
        sleep 3
    end

    it "sim, confirma" do 
        click_button "Confirma"
        mensagem  = page.driver.browser.switch_to.alert.text

        expect(mensagem).to eql "E ai confirma?"
        puts mensagem 
        sleep 3
        
        #o recurso "accept" aceita o que estiver mostrando na janela, no caso uma mensagem 
        #de alerta ou algo do tipo.
        page.driver.browser.switch_to.alert.accept
        
        #depois que é feito a confirmação na janela de alerta, é mostrado a mensagem 'Mensa-
        #gem confirmada', ele é mostrada numa área da página chamada results
        expect(page).to have_content 'Mensagem confirmada'
    end

    it "não confirma" do 
        click_button "Confirma"
        mensagem  = page.driver.browser.switch_to.alert.text

        expect(mensagem).to eql "E ai confirma?"
        puts mensagem 
        sleep 3
        
        #o recurso "dismiss" cancela o que estiver mostrando na janela, no caso uma mensagem 
        #de alerta ou algo do tipo.
        page.driver.browser.switch_to.alert.dismiss
        
        #depois que é feito a confirmação na janela de alerta, é mostrado a mensagem 'Mensa-
        #gem confirmada', ele é mostrada numa área da página chamada results
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'prompt', :accept_prompt do
        accept_prompt(with: 'Gustavo') do
            click_button 'Prompt'
            sleep 2
        end

        expect(page).to have_content "Olá, Gustavo"
        sleep 3
    end 

    it 'prompt', :dismiss_prompt do
        dismiss_prompt(with: '') do
            click_button 'Prompt'
            sleep 2
        end

        expect(page).to have_content "Olá, null"
        sleep 3
    end 


end 