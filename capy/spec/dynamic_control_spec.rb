describe "Dynamic Control", :dc do
  before(:each) do
    visit "/dynamic_controls"
  end

  it "quando habilita o campo" do
    #o recuso "page.has_field?" busca na pagina por um elemento com o ID
    #no caso o "move", e verifica se o atributo "disable" está ativado
    # quando tem a propriedade disable true,o campo esta desabilitado
    #quando não tem a propriedade disable o campo está habilitado
    res = page.has_field? "movie", disabled: true
    puts res

    click_button "Habilita"

    res = page.has_field? "movie", disabled: false
    puts res
  end
end
