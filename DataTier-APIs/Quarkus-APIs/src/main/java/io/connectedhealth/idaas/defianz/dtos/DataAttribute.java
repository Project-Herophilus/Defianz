package io.connectedhealth.idaas.defianz.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class DataAttribute {
    public int dataAttributeId;
    public String dataAttributeName;
    public String endpoint;

    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
