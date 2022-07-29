package io.connectedhealth.idaas.defianz.services;

import java.util.Map;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;
import org.apache.commons.codec.digest.DigestUtils;

import io.connectedhealth.idaas.defianz.dtos.PersonIdentityIn;
import io.connectedhealth.idaas.defianz.models.PersonIdentityEntity;


import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class PersonIdentityService {
    @Transactional
    public PersonIdentityEntity identify(PersonIdentityIn personInfo) {
        StringBuilder dataString = new StringBuilder();
        Map<String, Object> data = personInfo.identifiers;
        data.entrySet()
            .stream()
            .sorted(Map.Entry.<String, Object>comparingByKey())
            .forEach(dataString::append);

        String sha = DigestUtils.sha256Hex(dataString.toString());

        PersonIdentityEntity entity = new PersonIdentityEntity();
        entity.setApplication(personInfo.application);
        entity.setOrganization(personInfo.organization);
        entity.setSha256(sha);
        PersonIdentityEntity result = (PersonIdentityEntity)buildQuery(entity).firstResult();
        if (result == null) {
            entity.persistAndFlush();
            result = entity;
        }
        return result;
    }

    private PanacheQuery buildQuery(PersonIdentityEntity e){
        String query = "application = ?1 and organization = ?2 and sha256 = ?3";
        return PersonIdentityEntity.find(query, e.getApplication(), e.getOrganization(), e.getSha256());
    }     
}
