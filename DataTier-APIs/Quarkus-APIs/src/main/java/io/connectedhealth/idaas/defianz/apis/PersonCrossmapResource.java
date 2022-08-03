package io.connectedhealth.idaas.defianz.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import io.connectedhealth.idaas.defianz.audit.Audited;
import io.connectedhealth.idaas.defianz.dtos.CrossmapPersonDetail;
import io.connectedhealth.idaas.defianz.dtos.PersonIdentityIn;
import io.connectedhealth.idaas.defianz.services.CrossmapRetrieveService;
import io.connectedhealth.idaas.defianz.exception.DefianzException;

@Path("/person-crossmaps")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class PersonCrossmapResource {
    @Inject
    CrossmapRetrieveService service;

    @Audited
    @POST
    public List<CrossmapPersonDetail> identifyPerson(PersonIdentityIn personInfo) throws DefianzException {
        return service.retrieveMapping(personInfo);
    }
}
