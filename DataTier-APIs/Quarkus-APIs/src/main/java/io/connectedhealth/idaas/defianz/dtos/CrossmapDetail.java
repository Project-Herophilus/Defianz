package io.connectedhealth.idaas.defianz.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class CrossmapDetail {
    @Schema(readOnly = true)
    public long crossmapDetailId;

    public int dataAttributeId;
    public long crossmapId;
    public String crossmapField;

    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
