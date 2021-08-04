*** Settings ***
Library   RequestsLibrary
Library   Collections
Library   SeleniumLibrary
Library   FakerLibrary   locale=pt_BR

*** Variables ***
${URL}              https://trackmob.colabore.trackmobdev.com.br/SalvandoDouglas/single_step
${BROWSER}          chrome


*** Keywords ***




### Setup ###

Entrar na Página do Fichas de teste
    Open Browser   ${URL}    ${BROWSER}

### Teardown ###

Fechar Página
    Close Browser

### Keywords ###


${CPF}               FakerLibrary.cpf
${NAME}              Generate Random String    Generate Random String

${STREET}            Street Name
${STREET_NUMBER}     FakerLibrary.number
${STREET_SUFIX}      Street Suffix
${NEIGHBOUR}         Street Name
${CITY}              City


COMO Doador QUANDO preencher os campos com valores válidos
    Log To Console                    FakerLibrary.Words

    Wait Until Element Is Visible     xpath=//*[@id="person_name"]
    Input Text                        xpath=//*[@id="person_name"]                     ${NAME}
    Input Text                        xpath=//*[@id="person_email"]                    douglas@teste.com
    Input Text                        xpath=//*[@id="person_phone_number"]             (33) 33333-3333
    Input Text                        xpath=//*[@id="person_birthday"]                 12/12/2000

    Select From List By Value         xpath=//*[@id="person_gender"]                   male    
    
    Input Text                        xpath=//*[@id="person_payment_attributes_tax_identification_number"]     ${CPF}
    Select From List By Value         xpath=//*[@id="person_payment_attributes_payment_type"]                  1

    Input Text                        xpath=//*[@id="person_address_attributes_street"]                      ${STREET}
    Input Text                        xpath=//*[@id="person_address_attributes_number"]                      ${STREET_NUMBER}
    Input Text                        xpath=//*[@id="person_address_attributes_complement"]                  ${STREET_SUFIX}
    Input Text                        xpath=//*[@id="person_address_attributes_neighbour"]                   ${NEIGHBOUR}
    Input Text                        xpath=//*[@id="person_address_attributes_city"]                        ${CITY}  
    Select From List By Value         xpath=//*[@id="person_address_attributes_state_abbr"]                  AC

    Click Button                      xpath=//*[@id="single_step_submit"]

ENTÃO a doação deve ter sido efetuada com sucesso
    Location Should Be         https://trackmob.colabore.trackmobdev.com.br/SalvandoDouglas/single_step/done
    
