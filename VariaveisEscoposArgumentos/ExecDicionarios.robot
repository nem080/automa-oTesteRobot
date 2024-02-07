*** Settings ***
Documentation   Exercicio da aula de argumentos variaveis 
*** Comments ***
1 - Crie um arquivo de teste novo;

2 - Crie uma variável do tipo DICIONÁRIO na seção de variáveis 
...    globais que contenha nela os meses do ano e, para cada mês, 
...    informe o número de dias desse mês;
...    
3 - Crie um teste que imprima no Console (Log To Console) cada
...    mês e a sua respectiva quantidade de dias.
4 - Rode os testes e confira se logou tudo certinho!

*** Variables ***
&{Messes_Ano}    janeiro=30    fevereiro=30    março=29    abril=31    maio=28    junho=30    julho=31    agosto=29    setembro=27    outubro=30    novembro=29    dezembro=31   

*** Test Cases ***
Caso de teste exercicio da aula de variaveis 
    teste01

*** Keywords ***
teste01
    Log To Console     Em JANEIRO há ${Messes_Ano.janeiro} dias!
    Log To Console     Em FEVEREIRO há ${Messes_Ano.fevereiro} dias!
    Log To Console     Em MARÇO há ${Messes_Ano.março} dias!
    Log To Console     Em ABRIL há ${Messes_Ano.abril} dias!
    Log To Console     Em MAIO há ${Messes_Ano.maio} dias!
    Log To Console     Em JUNHO há ${Messes_Ano.junho} dias!
    Log To Console     Em JULHO há ${Messes_Ano.julho} dias!
    Log To Console     Em AGOSTO há ${Messes_Ano.agosto} dias!
    Log To Console     Em SETEMBRO há ${Messes_Ano.setembro} dias!
    Log To Console     Em OUTUBRO há ${Messes_Ano.outubro} dias!
    Log To Console     Em NOVEMBRO há ${Messes_Ano.novembro} dias!
    Log To Console     Em DEZEMBRO há ${Messes_Ano.dezembro} dias!