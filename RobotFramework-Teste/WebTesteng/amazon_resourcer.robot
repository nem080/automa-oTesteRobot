*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                            https://www.amazon.com.br/
${BTN_MENU_MAS_VENDIDOS}         //a[@data-csa-c-slot-id='nav_cs_1']
${HEADER_M_VENDIDOS}             //span[contains(.,'Mais vendidos')]
${COMPU_INFORMATICA}             //a[@href='/gp/bestsellers/computers/ref=zg_bs_nav_computers_0'][contains(.,'Computadores e Informática')]

# Variables teste 02
${INPUT_PESQUISA}                name=field-keywords
${CLICK_PESQUISAR}               //input[contains(@type,'submit')]

# Variables teste 03
${ABRIR_PRODUTO}                 //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'PlayStation®5 Slim Edição Digital')]
${ADD_CARRINHO}                  //input[@name='submit.add-to-cart']


# Variables teste 04
${EXCLUIR_CARRINHO}              //input[contains(@name,'submit.delete.b66eaf08-e8a9-4c1d-beaf-912cf28b55b5')]



*** Keywords ***
Abrir o navegador
    Open Browser  ${URL}  chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser



Acessar o home page do site Amazon.com.br
    Go To        url=${URL}
    Wait Until Element Is Visible    locator=${BTN_MENU_MAS_VENDIDOS}

Entrar no menu "Mais Vendidos"
    Click Element    locator=${BTN_MENU_MAS_VENDIDOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_M_VENDIDOS} 

Verificar se o título da página fica "${VERIFICAR_TITULO}" 
    Title Should Be    title=${VERIFICAR_TITULO}

Verificar se aparece o departamento "Computadores e Informática"
    Element Should Contain    locator=${COMPU_INFORMATICA}    expected=Computadores e Informática

Entrar na secao "Computadores e Informática" 
    Click Element    locator=${COMPU_INFORMATICA}



# caso de teste 02 - Pesquisa de um Produto
Digitar o nome de produto "${PRODUTO_PESQUISADO}" no campo de pesquisa
    Wait Until Element Is Visible    locator=${INPUT_PESQUISA}
    Input Text    ${INPUT_PESQUISA}    ${PRODUTO_PESQUISADO} 

Clicar no botão de pesquisa 
    Click Element    locator=${CLICK_PESQUISAR}

Verificar o resultado da pesquisa, se está listando o produto "${PRODUTO_PESQUISADO}"
    Wait Until Element Is Visible    locator=//a[contains(.,'${PRODUTO_PESQUISADO}')]




# GHERKIN BDD TESK TESTE 01 - Acesso ao menu "Mais Vendidos"
Dado que estou na home page da Amazon.com.br 
    Acessar o home page do site Amazon.com.br

Quando acessar o menu "Mais Vendidos" 
    Entrar no menu "Mais Vendidos" 
    Verificar se aparece a frase "Mais Vendidos"

# Então o título da página deve ficar "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
#     Element Should Contain    locator=${COMPU_INFORMATICA}    expected=Computadores e Informática

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página de partamento "Computadores e Informática"  
    Verificar se aparece o departamento "Computadores e Informática"  

E deve acessar a menu "Computadores e Informática" 
    Entrar na secao "Computadores e Informática" 

E o texto "Mais Vendidos em Computadores e Informática" deve conter
    Verificar se aparece a frase "Mais Vendidos em Computadores e Informática"



# GHERKIN BDD TESK TESTE 02 - Pesquisa de um Produto
# Dado que estou na home page da Amazon.com.br


Quando pesquisar pelo produto "playstation 5" 
    Digitar o nome de produto "playstation 5" no campo de pesquisa 
    Clicar no botão de pesquisa  

Então o título da página deve ficar "${VERIFICAR_TITULO}"
   Title Should Be    title=${VERIFICAR_TITULO}


E um produto da linha "playstation 5" deve ser mostrado na página 
    Click Element    locator=//div[@data-csa-c-pos='1']
    Wait Until Element Is Visible    locator=//span[@class='a-size-large product-title-word-break'][contains(.,'PlayStation®5 Slim Edição Digital')]



# Caso de Teste 03 - Adicionar Produto no Carrinho

Verificar o resultado da pesquisa se está listando o produto "Console playstation 5"
    Verificar o resultado da pesquisa, se está listando o produto "playstation 5" 
    Click Element    locator=${ABRIR_PRODUTO} 

Adicionar o produto "Console playstation 5" no carrinho
   Click Element    locator=${ADD_CARRINHO}

Verificar se o produto "Console playstation 5" foi adicionado com sucesso
   Click Element    locator=//a[contains(@data-csa-c-type,'button')]
   Wait Until Element Is Visible    locator=//span[@class='a-button-text a-declarative'][contains(.,'Qtd:1')]


# Caso de Teste 04 - Remover Produto do Carrinho

Remover o produto "Console playstation 5" do carrinho
    Click Element    locator=//span[@class='a-button-text a-declarative'][contains(.,'Qtd:1')]
    Click Element    locator=//a[@tabindex='-1'][contains(@id,'0')][contains(.,'0 (Excluir)')]

Verificar se o carrinho fica vazio
   Wait Until Element Is Not Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
   Capture Page Screenshot


# Funcionalidade: Adicionar e Remover Produtos no Carrinho no formato Gherkin
#  teste - Cenário: Adicionar Produto no Carrinho


Dado que estou na página inicial do site Amazon.com.br
    Acessar o home page do site Amazon.com.br 
Quando eu digito o nome do produto "playstation 5" no campo de pesquisa
    Digitar o nome de produto "playstation 5" no campo de pesquisa

E eu clico no botão de pesquisa
    Clicar no botão de pesquisa

Então eu verifico se o resultado da pesquisa lista o produto "Console playstation 5"
    Verificar o resultado da pesquisa se está listando o produto "Console playstation 5"  

E eu adiciono o produto "Console playstation 5" no carrinho
    Adicionar o produto "Console playstation 5" no carrinho

Então eu verifico se o produto "Console playstation 5" foi adicionado com sucesso
    Verificar se o produto "Console playstation 5" foi adicionado com sucesso



#  Teste 04 - Cenário: Remover Produto do Carrinho gherkin
# Dado que estou na página inicial do site Amazon.com.br
#     Acessar o home page do site Amazon.com.br 

# Quando eu digito o nome do produto "playstation 5" no campo de pesquisa
#     Digitar o nome de produto "playstation 5" no campo de pesquisa

# E eu clico no botão de pesquisa
#     Clicar no botão de pesquisa

# Então eu verifico se o resultado da pesquisa lista o produto "Console playstation 5"
#     Verificar o resultado da pesquisa se está listando o produto "Console playstation 5"

# E eu adiciono o produto "Console playstation 5" no carrinho
#     Adicionar o produto "Console playstation 5" no carrinho

# Então eu verifico se o produto "Console playstation 5" foi adicionado com sucesso
#     Verificar se o produto "Console playstation 5" foi adicionado com sucesso

# E eu removo o produto "Console playstation 5" do carrinho
#     Remover o produto "Console playstation 5" do carrinho

# Então eu verifico se o carrinho está vazio
#     Verificar se o carrinho fica vazio 
