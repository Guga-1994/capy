describe "Drag and Drop", :drop do
  before(:each) do
    visit "/drag_and_drop"
  end

  it "homem aranha pertence ao time stark" do

    #para construir o seletor que conseguisse trazer o elemento que repre-
    #senta a área de drop "O time stark", foi necessário começar a buscar
    #pela classe pai onde contem uma "Div <class =" .. team-stark">", já que não
    #tinha um atributo direto que diferenciasse as duas áreas.Porem a Div da
    #classe pai não retorna uma Div Dropavel, ou seja, que tenha a propriedade
    #droggable = true. Porém eu posso pegar a div da classe filho Div <class="column...">
    #que se refere ao time stark. logo temos o seguinte seletor ".team-stark .column"
    stark = find(".team-stark .column")
    #a variavel cap recebe as informações do elemento da área do capitão américa
    cap = find(".team-cap .column")

    # o comando find tá trazendo um elemento imagem, onde o seleter esta pedindo
    #uma imagem cujo o atributo alt termine com "Aranha", ele sejá o elemento que
    #irá dropar para a área selecionada.
    spiderman = find("img[alt$=Aranha]")

    #estou pegando o elemento imagem "spiderman" e trazendo para a área "stark"
    spiderman.drag_to stark

    #estou verificando se o alvo final(imagem do spiderman) está realmente dentro
    #do css da área de drop
    expect(stark).to have_css "img[alt$=Aranha]"
    #nesse caso estou confirmando que o elemento "spiderman" não está na área do
    #elemento do capitão américa
    expect(cap).not_to have_css "img[alt$=Aranha]"
    sleep 5
  end
end
