/// <reference types="cypress" />
const faker = require("faker");
faker.locale = "pt_BR";
const CPF = require("cpf");

Given("que eu entre na página de Doação single", () => {
  cy.visit(
    "https://trackmob.colabore.trackmobdev.com.br/SalvandoDouglas/single_step"
  );
});

When("Preencher os dados com informações válidas", () => {
  const data = {
    name: faker.name.findName(),
    email: faker.internet.email(),
    phone: faker.phone.phoneNumber(),

    street: faker.address.streetName(),
    number: faker.datatype.number(),
    complement: faker.address.streetPrefix(), 
    neighbour: faker.address.streetSuffix(),
    city: faker.address.city()
  };

  cy.get("#person_name").type(data.name);
  cy.get("#person_email").type(data.email);
  cy.get("#person_phone_number").type(data.phone);
  cy.get("#person_birthday").type("12122000");
  cy.get("#person_gender").select("male");

  cy.get("#person_address_attributes_street").type(data.street);
  cy.get("#person_address_attributes_number").type(data.number);
  cy.get("#person_address_attributes_complement").type(data.complement);
  cy.get("#person_address_attributes_neighbour").type(data.neighbour);
  cy.get("#person_address_attributes_city").type(data.city);
  cy.get("#person_address_attributes_state_abbr").select(faker.address.stateAbbr());
});

And("Adicionar um CPF Válido", () => {
  const cpfuser = CPF.generate();
  cy.get(
    "#person_form > #payment-step-page > .person_payment_tax_identification_number > :nth-child(2) > #person_payment_attributes_tax_identification_number"
  ).type(cpfuser);
});

And("Selecionar Boleto como método de pagamento", () => {
  cy.get(
    "#person_form > #payment-step-page > .person_payment_payment_type > :nth-child(2) > #person_payment_attributes_payment_type"
  ).select("Boleto");
});



Then("pagamento deve ser realizado com sucesso", () => {   
    
        cy.get("#single_step_submit").click()
        cy.url().should('eq','https://trackmob.colabore.trackmobdev.com.br/SalvandoDouglas/single_step/done')
});
