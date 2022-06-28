package io.connectedhealth.idaas.defianz.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.PATCH;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;

import io.connectedhealth.idaas.defianz.audit.Audited;
import io.connectedhealth.idaas.defianz.dtos.CrossmapDetail;
import io.connectedhealth.idaas.defianz.exception.DefianzException;
import io.connectedhealth.idaas.defianz.services.CrossmapService;

@Path("/crossmap_details")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CrossmapDetailResource {
    @Inject
    CrossmapService service;

    @Audited
    @GET
    @Path("/{crossmapDetailId}")
    public CrossmapDetail getCrossmapDetail(@Parameter(name="crossmapDetailId", required=true) @PathParam("crossmapDetailId") long crossmapDetailId) throws DefianzException {
        return service.getCrossmapDetail(crossmapDetailId);
    }    

    @Audited
    @PATCH
    @Path("/{crossmapDetailId}")
    public CrossmapDetail updateCrossmapDetail(@Parameter(name="crossmapDetailId", required=true) @PathParam("crossmapDetailId") long crossmapDetailId, CrossmapDetail detail) throws DefianzException {
        return service.updateCrossmapDetail(crossmapDetailId, detail);
    }

    @Audited
    @DELETE
    @Path("/{crossmapDetailId}")
    @APIResponse(responseCode = "204")
    public void createCrossmapDetail(@Parameter(name="crossmapDetailId", required=true) @PathParam("crossmapDetailId") long crossmapDetailId) throws DefianzException {
        service.deleteCrossmapDetail(crossmapDetailId);
    }

    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public CrossmapDetail createCrossmapDetail(CrossmapDetail crossmapDetail) throws DefianzException {
        return service.createCrossmapDetail(crossmapDetail);
    }
}
