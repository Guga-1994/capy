describe "Botões de Radio", :radio do

    before(:each) do
        visit "/radios"
    end

    it "seleção por ID" do
    #o recuso "choose" do capybara, faz a seleção de uma das 
    #opções do radio., mas so funciona para os elementos com "ID"
        choose('thor')
    end
    #no caso de so a ver os elementos de "value",pode se usar 
    #o recurso de find
    it "seleção por find e css selector" do
        find('input[value=guardians]').click

    end

    after(:each) do
        sleep 3
    end
end