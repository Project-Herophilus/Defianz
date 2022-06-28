package io.connectedhealth.idaas.defianz.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.PATCH;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;

import io.connectedhealth.idaas.defianz.audit.Audited;
import io.connectedhealth.idaas.defianz.dtos.Crossmap;
import io.connectedhealth.idaas.defianz.dtos.CrossmapDetail;
import io.connectedhealth.idaas.defianz.exception.DefianzException;
import io.connectedhealth.idaas.defianz.services.CrossmapService;

@Path("/crossmaps")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CrossmapResource {
    @Inject
    CrossmapService service;

    @Audited
    @GET
    public List<Crossmap> listCropssmaps() throws DefianzException {
        return service.listCrossmaps();
    }
 
    @Audited
    @GET
    @Path("/{crossmapId}")
    public Crossmap getCropssmap(@Parameter(name="crossmapId", required=true) @PathParam("crossmapId") long crossmapId) throws DefianzException {
        return service.getCrossmap(crossmapId);
    }

    @Audited
    @DELETE
    @Path("/{crossmapId}")
    @APIResponse(responseCode = "204")
    public void deleteCropssmap(@Parameter(name="crossmapId", required=true) @PathParam("crossmapId") long crossmapId) throws DefianzException {
        service.deleteCrossmap(crossmapId);
    }

    @Audited
    @PATCH
    @Path("/{crossmapId}")
    public Crossmap updateCropssmap(@Parameter(name="crossmapId", required=true) @PathParam("crossmapId") long crossmapId, Crossmap crossmap) throws DefianzException {
        return service.updateCrossmap(crossmapId, crossmap);
    }

    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public Crossmap createCrossmap(Crossmap crossmap) throws DefianzException {
        return service.createCrossmap(crossmap);
    }

    @Audited
    @GET
    @Path("/{crossmapId}/crossmap_details")
    public List<CrossmapDetail> getCrossmapDetails(@Parameter(name="crossmapId", required=true) @PathParam("crossmapId") long crossmapId) throws DefianzException {
        return service.listCrossmapDetails(crossmapId);
    }
}
