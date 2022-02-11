package io.connectedhealth.idaas.defianz.exception;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

@Provider
public class DefianzExceptionHandler implements ExceptionMapper<DefianzException> {

    @Override
    public Response toResponse(DefianzException exception) {
        return Response.status(Status.BAD_REQUEST).entity(exception.getMessage()).build();
    }    
}
