#Nessa seção sera configurado os teste a suit de teste.
*** Settings *** 
Documentation    essa suit testa o site da amazon.com.br
Resource         amazon_gerkin_resourcer.robot    
Test Setup       Abrir o navegador        #antes de cada test tem que rodar primeiro o setup
Test Teardown    Fechar o navegador       #test teardown sera para fechar o teste   



*** Test Cases ***
# TESTE GERKIN
formato bdd: ts01 Acessar o home page do site Amazon.com.br 
    Dado que o usuário está na página inicial da Amazon
    Quando o usuário entra no menu "Mais Vendidos" 
    Então deve verificar se a frase "Mais Vendidos" é exibida   
    E deve verificar se o título da página é "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon" 
    E deve verificar se o departamento "Computadores e Informática" está presente 
    Quando o usuário entra na seção "Computadores e Informática"
    E deve conter a frase "Mais Vendidos em Computadores e Informática" exibida  

Funcionalidade ts02: Adicionar Produtos no Carrinho no formato Gherkin
    [Documentation]        Esse teste e no formato bdd
    [Tags]             adicionar_carrinho_gherkin
    Dado que o usuário está na página inicial da Amazon
    Quando eu digito o nome do produto "playstation 5" no campo de pesquisa  
    E eu clico no botão de pesquisa 
    Então eu verifico se o resultado da pesquisa lista o produto "Console playstation 5" 
    E eu adiciono o produto "Console playstation 5" no carrinho 
    Então eu verifico se o produto "Console playstation 5" foi adicionado com sucesso  


Teste 04 - Cenário: Remover Produto do Carrinho gherkin
    [Documentation]        Esse texte e no formato bdd
    [Tags]             remover_carrinho_gherkin
    Dado que o usuário está na página inicial da Amazon 
    Quando eu digito o nome do produto "playstation 5" no campo de pesquisa 
    E eu clico no botão de pesquisa 
    Então eu verifico se o resultado da pesquisa lista o produto "Console playstation 5"
    E eu adiciono o produto "Console playstation 5" no carrinho
    Então eu verifico se o produto "Console playstation 5" foi adicionado com sucesso
    E eu removo o produto "Console playstation 5" do carrinho 
    Então eu verifico se o carrinho está vazio 
 