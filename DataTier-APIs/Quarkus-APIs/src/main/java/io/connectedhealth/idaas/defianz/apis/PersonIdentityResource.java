package io.connectedhealth.idaas.defianz.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import io.connectedhealth.idaas.defianz.audit.Audited;
import io.connectedhealth.idaas.defianz.dtos.PersonIdentity;
import io.connectedhealth.idaas.defianz.dtos.PersonIdentityIn;
import io.connectedhealth.idaas.defianz.services.PersonIdentityService;
import io.connectedhealth.idaas.defianz.exception.DefianzException;

@Path("/person-identities")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class PersonIdentityResource {
    @Inject
    PersonIdentityService service;

    @Audited
    @POST
    public PersonIdentity identifyPerson(PersonIdentityIn personInfo) throws DefianzException {
        return service.identify(personInfo);
    }
}
