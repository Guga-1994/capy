describe "Meu primeiro script",:hello, :smoke do
  it "visitar a pagina" do
    #é um comando do capybara
    visit "/"
    #chama a ´pagina e ela fica aberta no navegador por 5 segundos
    #sleep 5 #temporário

    #o page.title tbem é do capybara
    expect(page.title).to eql "Training Wheels Protocol"
  end
end
