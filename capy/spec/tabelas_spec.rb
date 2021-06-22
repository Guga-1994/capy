describe "tabelas", :tabs do

    before(:each) do 
        visit "/tables#"
    end
    
    
    it 'deve exibir o salário do stark' do
       #nesse cenário temos um problema, pois, não posso garantir que o 
       #"have_content" esta me trazendo o salário do personagem certo, visto
       #que tem mais de um personagem com o salário de 10.000.000, e esse 
       #método pesquisa o texto todo, no caso o "body" do HTML "$('body').text()"
       #expect(page).to have_content '10.000.000'
        
        #O método "find", recurso do capybara sempre retorna um único elemento
        #logo nesse caso ele retornará as 5 linhas da tabela, dando erro. Pois
        #o capybara não vai saber qual elemento ele vai manipular no retorno,
        #O seletor (table tbody tr) verifica as linhas da tabela (sendo o table
        #a classe pai, tbody classe filha e tr representando as linhas)
        #tr = find('table tbody tr')

        #o método "all" retorna com todos os elementos pequisados pelo seletor css
        #('table tbody tr'), a variável atores, recebe uma coleção de "trs"(tag que
        #que representa as linhas na tabela)
        atores= all('table tbody tr')
        
        #o comando "detect", é tipo um "for each", onde ele vai percorrer por todos
        #os atores (verificando os trs, que representa as linhas), logo ele vai dete-
        #ctar se o ator "Robert Downey Jr" está incluido, e gravar na variavel 'stark',
        #logo a variável stark receberá todo o registro da linha que contem o ator 
        #Robert.
        stark= atores.detect { |ator| ator.text.include?('Robert Downey Jr')}
        #verificar qual é o salário do ator, agora estamos verificando no registro
        #correto, espeficando através da busca do "detect"
        expect(stark.text).to include '10.000.000'
    end

    it 'deve exibir o salário do vin diesel', :diesel do
        #nesse caso usando o find, podemos procurar o registro atraves do css selector
        #'table tbody tr', e com o recurso "text" como um parâmetro do find, podemos usar 
        #uma informação "chave", exemplo o email que irá especificar o registro. Por exemplo
        #não poderia usar a chave sendo o salario com o valor de 10.000.000, pois existem 
        # 3 registros com essa mesma informação, dando erro no método finda, que só trabalha
        #com um elemento por vez.
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000.000'
    end

    it 'deve exibir o filme dos velozes' do

        #nesse caso vai ser trazido toda a linha do registro
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content 'Velozes e Furiosos'

        #para buscar pela coluna pq daí eu poderia detectar algum bug, por exemplo quando a
        #informação não estiver na coluna certa. Nesse caso atraves do seletor css:
        #$('table tbody tr:contains("@vindiesel") td'), onde o "td" é a tag que representa 
        #a coluna, esse script irá retornar todas as colunas, que no caso do exemplo serão
        #6. Através do método utilizado, 'diesel.all('td')', será trazido um array de elementos
        # esse array na posição 2 é que conterá a informação do filme, pois essa é a numeração
        #da coluna com essa informação. Com o comando 'diesel.all('td')[2].text', estou trazendo
        #exatamente a informação do filme que esta na coluna 2, lembrando que o array começa do 0.
        movie= diesel.all('td')[2].text

        expect(movie).to eql 'Fast & Furious'
    end

    it 'deve exibir o insta do Chris Evans' do
        evans = find('table tbody tr', text: 'Chris Evans')
        #a informação sobre o email está na colunaq 4, logo a posição do array será nesse índice
        insta = evans.all('td')[4].text
        
        expect(insta).to eql '@teamcevans'
        
    end

    it 'deve selecionar Chris Pratt para remoção' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        #na tabela, na ultima coluna tem as 'ações' que podem ser usadas para os registros, sendo
        #elas o editar e o remover, que são links, ao clicar em um dos links vai abrir uma janela 
        #com um alerta(java script alert). Para pegar o elemento correspondente ao link, foi especi-
        #onado código fonte e viu-se que a tag representando o link era o "a" que no html representa
        #link, que tinha a classe "delete", e tinha o texto "delete"
        prat.find('a', text: 'delete').click

        msg= page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'deve selecionar Chris Pratt para edição' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        #na tabela, na ultima coluna tem as 'ações' que podem ser usadas para os registros, sendo
        #elas o editar e o remover, que são links, ao clicar em um dos links vai abrir uma janela 
        #com um alerta(java script alert). Para pegar o elemento correspondente ao link, foi especi-
        #onado código fonte e viu-se que a tag representando o link era o "a" que no html representa
        #link, que tinha a classe "edit", e tinha o texto "edit"
        prat.find('a', text: 'edit').click

        msg= page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
end