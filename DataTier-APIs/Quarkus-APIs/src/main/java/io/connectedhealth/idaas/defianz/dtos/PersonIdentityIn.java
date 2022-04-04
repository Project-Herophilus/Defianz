package io.connectedhealth.idaas.defianz.dtos;

import java.util.Map;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class PersonIdentityIn {
    public String application;
    public String organization;
    public Map<String, Object> identifiers;


    public PersonIdentityIn() {
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}