package io.connectedhealth.idaas.defianz.services;

import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;

import io.connectedhealth.idaas.defianz.dtos.DataAttribute;
import io.connectedhealth.idaas.defianz.models.DataAttributeEntity;
import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class DataAttributeService {
    public List<DataAttribute> listDataAttributes(){
        PanacheQuery<DataAttributeEntity> entities = DataAttributeEntity.findAll();
        return entities.stream().map(e -> mapDataAttributeEntityToDTO(e)).collect(Collectors.toList());
    }

    protected DataAttribute mapDataAttributeEntityToDTO(DataAttributeEntity e) {
        DataAttribute dataAttribute = new DataAttribute();
        dataAttribute.dataAttributeId = e.getDataAttributeId();
        dataAttribute.dataAttributeName = e.getDataAttributeName();
        dataAttribute.endpoint = e.getEndpoint();
        return dataAttribute;
    }
}
