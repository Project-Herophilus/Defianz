package io.connectedhealth.idaas.defianz.services;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.json.JsonObject;
import javax.transaction.Transactional;

import org.eclipse.microprofile.rest.client.inject.RestClient;

import io.connectedhealth.idaas.defianz.datasynthesis.IDataSynthesisService;
import io.connectedhealth.idaas.defianz.dtos.CrossmapPersonDetail;
import io.connectedhealth.idaas.defianz.dtos.PersonIdentityIn;
import io.connectedhealth.idaas.defianz.models.CrossmapDetailEntity;
import io.connectedhealth.idaas.defianz.models.CrossmapEntity;
import io.connectedhealth.idaas.defianz.models.CrossmapPersonDetailEntity;
import io.connectedhealth.idaas.defianz.models.PersonIdentityEntity;

@ApplicationScoped
public class CrossmapRetrieveService {
    @Inject
    PersonIdentityService personService;

    @Inject
    @RestClient
    IDataSynthesisService dataService;
    
    public List<CrossmapPersonDetail> retrieveMapping(PersonIdentityIn personInfo){
        PersonIdentityEntity personIdentity = personService.identify(personInfo);
        List<CrossmapPersonDetailEntity> results = CrossmapPersonDetailEntity.find("personIdentity = ?1", personIdentity).list();
        if(results.isEmpty()) {
            results = createCrossmapPersonDetails(personIdentity);
        }
        return results.stream().map(e -> mapEntityToDTO(e)).collect(Collectors.toList());
    }

    @Transactional
    protected List<CrossmapPersonDetailEntity> createCrossmapPersonDetails(PersonIdentityEntity person) {
        CrossmapEntity crossMap = CrossmapEntity.find("application = ?1 AND organization = ?2", person.getApplication(), person.getOrganization()).firstResult();
        List<CrossmapDetailEntity> cmDetails = CrossmapDetailEntity.find("crossmapid = ?1", crossMap.getCrossmapId()).list();
        List<CrossmapPersonDetailEntity> results = new ArrayList<CrossmapPersonDetailEntity>();
        for(CrossmapDetailEntity cm : cmDetails) {
            JsonObject data = dataService.randomOne(cm.getDataAttribute().getEndpoint(), 1).get(0);
            CrossmapPersonDetailEntity cpde = new CrossmapPersonDetailEntity();
            cpde.setCrossmapDetail(cm);
            cpde.setPersonIdentity(person);
            cpde.setDataValueId(data.getInt("id"));
            cpde.persist();
            results.add(cpde);
        }
        return results;
    }


    protected CrossmapPersonDetail mapEntityToDTO(CrossmapPersonDetailEntity e) {
        CrossmapPersonDetail dto = new CrossmapPersonDetail();
        dto.crossmapField = e.getCrossmapDetail().getCrossmapField();
        dto.dataAttributeId = e.getCrossmapDetail().getDataAttribute().getDataAttributeId();
        dto.dataValueId = e.getDataValueId();
        return dto;
    }
}
