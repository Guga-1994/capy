describe 'alternando janelas', :window do

    before(:each) do
        visit '/windows'
    end

    it 'Abrindo uma nova janela' do
        #o recurso "window_opened_by" é um recurso do capybara que guarda
        #informações de nova janela em um variável;
        #o recurso "click_link" é um evento de click no link que 
        #levará para a proxima página;
        nova_janela =window_opened_by {click_link 'Clique aqui'}
        
        #o "within_window" é um escopo de código e dentro dele tem
        #uma verificação da página, para saber se é a "Nova Janela"
        #que abriu e poder manipular elementos HTML dessa nova janela
        within_window -> {page.title == 'Nova Janela'} do
            expect(page).to have_content 'Aqui temos uma nova janela \o/'
        end
        
        #método que fecha a nova janela que foi aberta no capybara
        nova_janela.close
        expect(nova_janela.closed?).to be true
        sleep 3
    end

end 