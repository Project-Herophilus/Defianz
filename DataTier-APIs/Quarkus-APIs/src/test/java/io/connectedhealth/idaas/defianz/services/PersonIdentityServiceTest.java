package io.connectedhealth.idaas.defianz.services;

import java.util.HashMap;

import javax.inject.Inject;

import io.connectedhealth.idaas.defianz.dtos.PersonIdentity;
import io.connectedhealth.idaas.defianz.dtos.PersonIdentityIn;


import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class PersonIdentityServiceTest {
    @Inject
    PersonIdentityService service;

    private PersonIdentityIn prepareInput() {
        PersonIdentityIn personIn = new PersonIdentityIn();
        personIn.identifiers = new HashMap<String, Object>();
        personIn.identifiers.put("Key1", 123);
        personIn.identifiers.put("Key2", "abc");
        personIn.application = "app";
        personIn.organization = "ORG";
        return personIn;
    }

    @Test
    public void testIdentifyPerson() {
        PersonIdentityIn personIn1 = prepareInput();
        PersonIdentity out1 = service.identify(personIn1);
        Assertions.assertTrue(out1.personIdentityId > 0);

        PersonIdentityIn personIn2 = prepareInput();
        PersonIdentity out2 = service.identify(personIn2);
        Assertions.assertEquals(out1.personIdentityId, out2.personIdentityId);
    }
}
