describe "Upload", :upload do
  before(:each) do
    visit "/upload"
    #o recurso pwd é um método que retorna um caminho no qual
    #eu tenho diretório de execução do meu projeto
    @arquivo = Dir.pwd + "/spec/fixtures/arquivo.txt"
    @imagem = Dir.pwd + "/spec/fixtures/Capybara_gemFile.png"
  end

  it "upload com arquivo texto" do
    attach_file("file-upload", @arquivo)
    #simula o click no botão, logo vai ser direcionado para
    #outra página, a página de resposta, mostrando o nome do
    #arquivo que foi taxado
    click_button "Upload"
    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "arquivo.txt"
  end

  it "upload com arquivo de imagem", :upload_image do
    attach_file("file-upload", @imagem)

    click_button "Upload"

    #Haverá um erro quando acionar o butão pois a imagem
    #demora para ser carregada, o capybara vai procurar
    #e não vai encontrar o elemento que recebe o arquivo
    # logo, a ideia seria mudar o tempo padrão do capybara,
    #indo para o arquivo "speac_helper.rb" e colocando
    #o código "config.default_max_wait_time = 5"

    #O "img" acaba por se transformar em um
    #elemento do capybara, pois esta recendo
    #uma informação através do find
    img = find("#new-image")
    expect(img[:src]).to include "/uploads/Capybara_gemFile.png"
  end

  after(:each) do
    sleep 3
  end
end
