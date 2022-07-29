package io.connectedhealth.idaas.defianz.datasynthesis;

import java.util.List;

import javax.json.JsonObject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;
import org.jboss.resteasy.annotations.jaxrs.PathParam;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/api")
@RegisterRestClient
public interface IDataSynthesisService {
    @GET
    @Path("/{resourceName}")
    List<JsonObject> randomOne(@PathParam String resourceName, @QueryParam("count") int count);
}
