package io.connectedhealth.idaas.defianz.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;


import io.connectedhealth.idaas.defianz.audit.Audited;
import io.connectedhealth.idaas.defianz.dtos.DataAttribute;
import io.connectedhealth.idaas.defianz.exception.DefianzException;
import io.connectedhealth.idaas.defianz.services.DataAttributeService;

@Path("/dataattributes")
@Produces(MediaType.APPLICATION_JSON)
public class DataAttributeResource {
    @Inject
    DataAttributeService service;

    @Audited
    @GET
    public List<DataAttribute> listDataAttributes() throws DefianzException {
        return service.listDataAttributes();
    }
}
