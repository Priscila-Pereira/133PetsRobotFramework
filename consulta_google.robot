*** Settings ***
Documentation    Teste de consulta no buscador Google
...  abre o navegador Chrome
...  e realiza a consulta

Library  SeleniumLibrary

*** Test Cases ***
Consulta Google
Test title
    [Tags]    rapido
    Acessar o Chrome na página <https://www.google.com.br>
    Digitar na pesquisa "Ovo de Páscoa" na pesquisa
    Validar se aparece no título da guia o resultado esperado
    Fechar o browser



*** Keywords ***
Acessar o ${browser} na pagina <${url}>
    open browser    ${url} ${browser}

Digitar ${palavra_chave} na pesquisa
    Set Test Variable  ${palavra_chave}
    input text  name = q        ${palavra_chave}
    press keys  name = q        ENTER

Validar se aparece no título da guia o resultado esperado
    ${titulo} = get title
    Should contain  ${titulo}    ${palavra_chave}

Fechar o browser
    close browser