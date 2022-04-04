package io.connectedhealth.idaas.defianz.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class PersonIdentity {
    public long personIdentityId;
    public String application;
    public String organization;


    public PersonIdentity() {
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}