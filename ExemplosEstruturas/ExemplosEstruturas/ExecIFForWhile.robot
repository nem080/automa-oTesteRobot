*** Settings ***
Library    SeleniumLibrary


Documentation    Siga os seguintes passos:Declare uma variável do tipo lista com vários 
...              números Crie uma keyword que percorra essa lista usando o FOR Dentro do FOR, 
...              faça um bloco IF que imprima no Log a frase "Eu sou o número 5!" e "Eu sou o número 10!",
...              ou seja, só pode imprimir quando o número atual da lista for 5 ou 10.
...              Use o ELSE para imprimir no Log a frase "Eu não sou o número 5 e nem o 10!"


*** Variables ***
@{NUMEROS}    1    2    3    4    5    6    7    8    9    10    11    12    13    14    15    


*** Test Cases ***
Percorrer lista
    percorrer lista usando for


*** Keywords ***
percorrer lista usando for
    Log To Console    ${\n}
    FOR    ${ELEMENTO}    IN    @{NUMEROS}
        IF    ${ELEMENTO} == 5
            Log To Console    Eu sou o numero: ${ELEMENTO}  
        ELSE IF    ${ELEMENTO} == 10
            Log To Console    Eu sou o numero: ${ELEMENTO}  
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10! eu sou o numero: ${ELEMENTO}         
        END   
    END