package io.connectedhealth.idaas.defianz.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class Crossmap {
    @Schema(readOnly = true)
    public long crossmapId;
    
    public String crossmapDesc;
    public String industryStd;
    public String organization;
    public String application;

    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
