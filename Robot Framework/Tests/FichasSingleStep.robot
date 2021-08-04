*** Settings ***
Resource         ../Resources/FichasSingleStep_resource.robot



Test Setup       Entrar na Página do Fichas de teste
# Test Teardown    Fechar Página



*** Test Case ***

Caso de Teste 01: Doação válida Boleto


    COMO Doador QUANDO preencher os campos com valores válidos
    # E Preencher com CPF Válido
    # E escolher a opção de Boleto
    # E Confimar a Doação
    ENTÃO a doação deve ter sido efetuada com sucesso



