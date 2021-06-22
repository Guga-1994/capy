describe "teclado", :teclado do
  before(:each) do
    visit "/key_presses"
  end

  it "enviando teclas" do
    #para usar o array de simbolos devemos usar o "%i"
    teclas = %i[tab escape space enter shift control alt]

    teclas.each do |t|

      #usando o id do campo de texto que receberá as teclas, "campo-id"
      #podemos usar o a função ".send_keys" para enviar as ações do teclado
      find("#campo-id").send_keys t #caso queira enviar so um simbolo ":space"

      #quando você tecla no campo, aparece uma mensagem em baixo
      #dizendo qual tecla foi acionada, neste caso foi o space,
      #logo usando o "have_content" é possivel testar se a mensa-
      #gem realmente está aparecendo na página
      expect(page).to have_content "You entered: " + t.to_s.upcase #o "key" se tornará string maiuscula
      sleep 1
    end
  end

  it "enviando letras", :letras do
    #o %w cria um array de string
    letras = %w[a s d f g h j k l] #datilografia

    letras.each do |l|
      find("#campo-id").send_keys l #caso queira enviar so uma letra ":a"
      expect(page).to have_content "You entered: " + l.to_s.upcase #o "key" se tornará string maiuscula
      sleep 1
    end
  end
end
