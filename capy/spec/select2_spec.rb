#esse componente é tipo um combobox (dropdown), porém tem um técnica um
#pouco diferente para ser manipulado, geralmente ela é usada com aplica-
# do "Angular"

describe "Select2", :select2 do
  describe("Single", :single) do
    before(:each) do
      visit "/apps/select2/single.html"
    end

    it "seleciona ator por nome" do

      #clicar no elemento para abri a caixa de opções, no console o elemento da caixa
      #não estava sendo acionada por essa classe quando testado no console, mas funcio-
      #nou quando testou no capybara.
      find(".select2-selection--single").click
      sleep 5

      #escolhendo a opção do "Adam Sandler"  la na caixa do select, usando a o elemento
      # ".select2-results__option"
      find(".select2-results__option", text: "Adam Sandler").click
      sleep 5
    end

    it "busca e clica no ator" do
      #será habilitado a caixa do select, depois será buscado o nome "Cris Rock"
      #e depois será clicado nessa opção buscada, seguindo assim o fluxo do teste
      find(".select2-selection--single").click
      sleep 1
      find(".select2-search__field").set "Cris Rock"
      sleep 1
      find(".select2-results__option").click
      sleep 1
    end
  end

  describe("Multiple", :multi) do
    before(:each) do
      visit "/apps/select2/multi.html"
    end

    #metodo que recebe o nome do ator e cria o fluxo de procurar um ator na caixa
    #de seleção, setar o ator e clicar como opção
    def selecione(ator)
      find(".select2-selection--multiple").click
      find(".select2-search__field").set ator
      find(".select2-results__option").click
    end

    it "seleciona atores" do
      atores = ["Jim Carrey", "Owen Wilson", "Chris Rock"]

      #for each usando para percorrer o array de atores
      atores.each do |a|
        selecione(a)
        sleep 1
      end
    end
  end
end
