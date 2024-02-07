
*** Settings ***
Documentation    1 - Crie um arquivo de teste novo;
...    2 - Crie uma variável do tipo LISTA na seção de variáveis globais que contenha todos os meses do ano;
...    3 - Crie um teste que imprima no Console (Log To Console) cada item dessa lista (não use FOR, imprima um a um).
...    4 - Rode os testes e confira se logou tudo certinho!
...    Perguntas dessa tarefa
...    
...    Como você implementou? Conta pra gente! Cole os trechos do código criados/alterados.
*** Variables ***
@{Lista}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro   
*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01



*** Keywords ***
Uma keyword qualquer 01
    Log Many    @{Lista}