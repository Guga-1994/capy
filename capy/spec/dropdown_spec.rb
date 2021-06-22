
#a tag :tag(nesse caso usamos a palavra dropdown) 
#é um recurso do rspec para
#poder identificar a suite de teste e poder
#permitir que a pessoa so rode essa suíte
describe "Caixa de opções", :dropdown do

     #esse recurso funciona muito bem para caixas
    #de opções que tem elementos do tipo select 
    #com o id., caso o "dropdown" representa o id.
    it "item especifico simples"  do
        visit '/dropdown'
       
        select('Loki', from: 'dropdown')
        sleep 3 #temporário
    end

    #esse recurso funciona bem quando tempos no select item(dropdown), 
    #a falta do id, sendo usado nesse caso o seletor find.
    it 'item especifico com o find' do
        visit '/dropdown'
        #o drop vai guardar a busca de elementos da class "avenger-list"
        #no css, busca via css selector da classe ".avenger-list"
        drop = find('.avenger-list')
        #busca dentro do avenger-list que é um seletor, um
        #elemento do tipo option, cujo texto é passado.
        drop.find('option', text: 'Scott Lang').select_option
    end
    it 'qualquer item', :sample do 
        visit '/dropdown'
        drop = find('.avenger-list')
        #o seletor "find" só tras uma opção, nesse caso ele daria errado porque
        #na pagina selecionada tem 8 option, logo o capybara dará erro.
        #drop.find('option')

        #o método all traz um array, no caso um array de option
        #o metodo "sample"(recurso do ruby) sorteia os elementos de um array de
        #forma randômica, deppois de sortear o "selection_option"
        #irá selecionar essa escolha na droplist(dropdown/combobox)
        drop.all('option').sample.select_option
    end

end