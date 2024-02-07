*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                           https://www.amazon.com.br/
${BTN_MENU_MAS_VENDIDOS}         //a[@data-csa-c-slot-id='nav_cs_1']
${HEADER_M_VENDIDOS}             //span[contains(.,'Mais vendidos')]
${COMPU_INFORMATICA}             //a[@href='/gp/bestsellers/computers/ref=zg_bs_nav_computers_0'][contains(.,'Computadores e Informática')]
${TITULO_ELETRONICO}             //title[contains(.,'Amazon.com.br Mais Vendidos: Computadores e Informática - os mais vendidos na Amazon.com.br')]

# Variables teste 02
${INPUT_PESQUISA}                name=field-keywords
${CLICK_PESQUISAR}               //input[contains(@type,'submit')]
${RETORNO_PRODUTO}               //img[@data-image-index='1']

# Variables teste 03
${ABRIR_PRODUTO}                 //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'PlayStation®5 Slim Edição Digital')]
${ADD_CARRINHO}                  //input[@name='submit.add-to-cart']


# Variables teste 04
${EXCLUIR_CARRINHO}              //input[contains(@name,'submit.delete.b66eaf08-e8a9-4c1d-beaf-912cf28b55b5')]
${VERIFICAR_PRODUTO_CARRINHO}    //span[@class='a-size-large product-title-word-break'][contains(.,'PlayStation®5 Slim Edição Digital')]


*** Keywords ***
Abrir o navegador
    Open Browser  ${URL}  chrome
    Maximize Browser Window
    

Fechar o navegador
    Capture Page Screenshot
    Close Browser


# GHERKIN BDD TESK TESTE 01 - Acesso ao menu "Mais Vendidos"
Dado que o usuário está na página inicial da Amazon
    Go To        url=${URL}
    Execute JavaScript    location.reload(true)
    Wait Until Element Is Visible    locator=${BTN_MENU_MAS_VENDIDOS} 

Quando o usuário entra no menu "Mais Vendidos" 
    Click Element    locator=${BTN_MENU_MAS_VENDIDOS}

Então deve verificar se a frase "${FRASE}" é exibida 
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_M_VENDIDOS} 

E deve verificar se o título da página é "${VERIFICAR_TITULO}" 
    Title Should Be    title=${VERIFICAR_TITULO}

E deve verificar se o departamento "Computadores e Informática" está presente
    Element Should Contain    locator=${COMPU_INFORMATICA}    expected=Computadores e Informática

Quando o usuário entra na seção "Computadores e Informática"
    Click Element    locator=${COMPU_INFORMATICA}

E deve conter a frase "Mais Vendidos em Computadores e Informática" exibida
     Wait Until Page Contains Element    locator=//h1[@class='a-size-large a-spacing-medium a-text-bold'][contains(.,'Mais Vendidos em Computadores e Informática')]

# GHERKIN BDD TESK TESTE 02 - Pesquisa de um Produto add ao carrinho
Dado que estou na home page da Amazon.com.br
    Dado que o usuário está na página inicial da Amazon
Quando eu digito o nome do produto "${PRODUTO_PESQUISADO}" no campo de pesquisa   
    Wait Until Element Is Visible    locator=${INPUT_PESQUISA}
    Input Text    ${INPUT_PESQUISA}    ${PRODUTO_PESQUISADO}

E eu clico no botão de pesquisa
    Click Element    locator=${CLICK_PESQUISAR}

Então eu verifico se o resultado da pesquisa lista o produto "Console playstation 5" 
    Wait Until Element Is Visible    locator=${RETORNO_PRODUTO}

E eu adiciono o produto "Console playstation 5" no carrinho 
    Click Element    locator=${ABRIR_PRODUTO}
    WaitUntil Element Is Visible    locator=${VERIFICAR_PRODUTO_CARRINHO}
    Click Element    locator=${ADD_CARRINHO}
    
Então eu verifico se o produto "Console playstation 5" foi adicionado com sucesso 
   Click Element    locator=//a[contains(@data-csa-c-type,'button')]
   Wait Until Element Is Visible    locator=//span[@class='a-button-text a-declarative'][contains(.,'Qtd:1')]


# # Caso de Teste 04 - Remover Produto do Carrinho
E eu removo o produto "Console playstation 5" do carrinho
    Click Element    locator=//span[@class='a-button-text a-declarative'][contains(.,'Qtd:1')]
    Click Element    locator=//a[@tabindex='-1'][contains(@id,'0')][contains(.,'0 (Excluir)')]

Então eu verifico se o carrinho está vazio
   Wait Until Element Is Not Visible    locator=//h1[contains(@class,'a-spacing-mini a-spacing-top-base')]
   Capture Page Screenshot
