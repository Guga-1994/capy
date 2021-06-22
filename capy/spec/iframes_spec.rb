describe 'iframes' do

    describe 'bom', :nice_iframe do
        before(:each) do
            visit '/nice_iframe'
        end

        it 'adicionar ao carrinho' do

            #escopo de código do capybara que serve para manipular os iframes, usando
            #o comando "within_frame", o capybara consegue manipular o iframe desde que
            #ele tenha o atributo "id" ou "name", caso não tenha, o capybara não consegue
            #ter acesso ao iframe e manipula-lo
            within_frame('burgerId') do
                produto = find(".menu-item-info-box", text: "REFRIGERANTE")
                produto.find("a").click
                expect(find('#cart')).to have_content 'R$ 4,50'
                sleep 3
            end
        end

    end
    
    describe 'ruim', :bad_iframe do

        before(:each) do

          visit  '/bad_iframe'
        
        end

        it "carrinho deve estar vazio" do
            
            #script usando o recurso de javascript para criar um id temporário para
            #ser usado pelos métodos do "within_frame" do capybara que não funciona
            #sem um atributo id ou name. É um truque, usando  um recurso 
            script = '$(".box-iframe").attr("id", "tempId");'
            # com o método do capybara ".execute_script" vai rodar o script antes 
            #de validar o iframe
            page.execute_script(script)
            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
        end
    end
    
end