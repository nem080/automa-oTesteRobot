#Nessa seção sera configurado os teste a suit de teste.
*** Settings *** 
Documentation    essa suit testa o site da amazon.com.br
Resource         amazon_resourcer.robot    
Test Setup       Abrir o navegador        #antes de cada test tem que rodar primeiro o setup
Test Teardown    Fechar o navegador       #test teardown sera para fechar o teste   



*** Test Cases ***
caso de teste 01 - Acesso ao menu "Mais Vendidos"
    [Documentation]    este teste verifica o menu eletronico do site da amazon.com.br
     ...               e verifica a categoria computadores e informatica 
      
     [Tags]            menus    mais_vendido  #tag usada para descrever oque se trata o teste uma busca no menu mais vendido
    Acessar o home page do site Amazon.com.br
    Entrar no menu "Mais Vendidos" 
    Verificar se aparece a frase "Mais Vendidos"
    Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    Verificar se aparece o departamento "Computadores e Informática"  
    Entrar na secao "Computadores e Informática" 
    Verificar se aparece a frase "Mais Vendidos em Computadores e Informática"


'caso de teste 02 - Pesquisa de um Produto'
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produto     verificar_busca_produto
    Acessar o home page do site Amazon.com.br 
    Digitar o nome de produto "playstation 5" no campo de pesquisa 
    Clicar no botão de pesquisa  
    Verificar o resultado da pesquisa, se está listando o produto "playstation 5" 

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar o home page do site Amazon.com.br 
    Digitar o nome de produto "playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console playstation 5"  
    Adicionar o produto "Console playstation 5" no carrinho
    Verificar se o produto "Console playstation 5" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar o home page do site Amazon.com.br 
    Digitar o nome de produto "playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console playstation 5"
    Adicionar o produto "Console playstation 5" no carrinho
    Verificar se o produto "Console playstation 5" foi adicionado com sucesso
    Remover o produto "Console playstation 5" do carrinho
    Verificar se o carrinho fica vazio 


