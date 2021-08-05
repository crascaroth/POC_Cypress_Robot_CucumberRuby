Feature: Doação Single Step Boleto

    Scenario: Doação em boleto com dados válidos
        Given que eu entre na página de Doação single
        When Preencher os dados com informações válidas
        And Adicionar um CPF Válido
        And Selecionar Boleto como método de pagamento
        Then pagamento deve ser realizado com sucesso
