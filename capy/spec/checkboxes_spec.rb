
describe "Caixas de Seleção", :checkbox do 
    #essa estrutura do before funciona como se fosse um gancho no rspec
    #para todos os cenários será necessario visitar a página indicada
    #logo esse bloco de código vai rodar antes dos cenários de teste
    before(:each) do
        visit '/checkboxes'
    end
    #o "check" e o "uncheck" funciona tanto para os elementos tipo "id" e tipo
    #"name", porem as vezes não tem essas opções, porem sempre terá que existir
    #o atributo value, senão a informação não podera enviar as coisas para o ser-
    #vidor
    it "marcando uma opção" do 
        check('thor')
    end

    it "desmarcando uam opção" do
        uncheck('antman')
    end

    #Ao usar o find podemos utilizar os atributos de value que
    #necessariamente devem contem no script html relacionado ao 
    #checkbox, sendo necessário para o value associado ao input
    it "marcando com o find set true" do
        find('input[value=cap]').set(true)
    end

    it "desmarcando com o find set false" do
        find('input[value=guardians]').set(false)
    end

    after(:each) do 
        sleep 3 #temporário
    end 
end
