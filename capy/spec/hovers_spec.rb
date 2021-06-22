describe "Mouse Hover", :hovers do
  before(:each) do
    visit "/hovers"
  end

  it "Quando passo o mouse sobre o blade" do

    #podemos pegar a informação de um seletor pela informação do "img[alt=Blade]"
    #pois o recurso é uma imagem associado ao tipo'img' que tem um atributo chamado
    #"alt" e passar o valor do atributo, nesse caso o "Blade", que identifica a imagem

    #Pode-se usar uma "expressão regular" para deixar o seletor mais interessante:
    #Ex: $("img[alt^=Pantera]"); eu quero um elemento do tipo "img" que tenha o valor de "alt"
    #começando com "Pantera", o "^" serve para pegar o "começo do valor";

    #Ex: $("img[alt$=Aranha]");eu quero um elemento do tipo "img" que tenha o valor de "alt"
    #terminando em "Aranha", o "$" serve para pegar o "final do valor";

    #Ex: $("img[alt*=Aranha]");eu quero um elemento do tipo "img" cujo o valor de "alt" "contenha
    #a palavra aranha", o "*" serve para pegar e verificar se o valor contem o parâmetro

    card = find("img[alt=Blade]")
    card.hover

    expect(page).to have_content "Nome: Blade"
  end

  it "Quando passo o mouse sobre o homem aranha" do
    #como o nome Pantera negra tem um espaço e isso é considerado como
    #caractere especial, ele tem que vir dentro de aspas simples, ja que
    #o comando vem em aspas duplas. No exemplo do Blade, não tinha caracteres
    #especiais de modo de não precisou usar as aspas.
    card = find("img[alt='Pantera Negra']")
    card.hover

    expect(page).to have_content "Nome: Pantera Negra"
  end

  it "Quando passo o mouse sobre o homem aranha" do
    card = find("img[alt='Homem Aranha']")
    card.hover

    expect(page).to have_content "Homem Aranha"
  end

  after(:each) do
    sleep 2 #temporário so para verificar o resultado
  end
end
