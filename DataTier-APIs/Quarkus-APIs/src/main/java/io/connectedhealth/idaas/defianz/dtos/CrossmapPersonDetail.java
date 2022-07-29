package io.connectedhealth.idaas.defianz.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class CrossmapPersonDetail {
    public int dataAttributeId;
    public long dataValueId;
    public String crossmapField;

    public CrossmapPersonDetail(){}

    public CrossmapPersonDetail(int dataAttributeId, long dataValueId, String crossmapField) {
        this.dataAttributeId = dataAttributeId;
        this.dataValueId = dataValueId;
        this.crossmapField = crossmapField;
    }

    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
