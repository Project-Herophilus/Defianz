package io.connectedhealth.idaas.defianz.services;

import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.defianz.dtos.Crossmap;
import io.connectedhealth.idaas.defianz.dtos.CrossmapDetail;
import io.connectedhealth.idaas.defianz.models.CrossmapDetailEntity;
import io.connectedhealth.idaas.defianz.models.CrossmapEntity;
import io.connectedhealth.idaas.defianz.models.DataAttributeEntity;
import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class CrossmapService {
    @Transactional
	public Crossmap createCrossmap(Crossmap crossmap) {
        CrossmapEntity entity = new CrossmapEntity();
        entity.setApplication(crossmap.application);
        entity.setOrganization(crossmap.organization);
        entity.setCrossmapDesc(crossmap.crossmapDesc);
        entity.setIndustryStd(crossmap.industryStd);
        entity.persistAndFlush();
		return mapCrossmapEntityToDTO(entity);
	}

    @Transactional
    public Crossmap getCrossmap(long id) {
        CrossmapEntity entity = CrossmapEntity.findById(id);
		return mapCrossmapEntityToDTO(entity);
	}

    @Transactional
    public Crossmap updateCrossmap(long id, Crossmap crossmap) {
        CrossmapEntity entity = CrossmapEntity.findById(id);
        if (crossmap.application != null) 
            entity.setApplication(crossmap.application);
        if (crossmap.organization != null)
            entity.setOrganization(crossmap.organization);
        if (crossmap.industryStd != null)
            entity.setIndustryStd(crossmap.industryStd);
        if (crossmap.crossmapDesc != null)
            entity.setCrossmapDesc(crossmap.crossmapDesc);
        entity.persistAndFlush();
        return mapCrossmapEntityToDTO(entity);
    }

    @Transactional
    public void deleteCrossmap(long id) {
        CrossmapEntity.deleteById(id);
    }

    public List<Crossmap> listCrossmaps(){
        PanacheQuery<CrossmapEntity> entities = CrossmapEntity.findAll();
        return entities.stream().map(e -> mapCrossmapEntityToDTO(e)).collect(Collectors.toList());
    }

    @Transactional
    public CrossmapDetail createCrossmapDetail(CrossmapDetail crossmapDetail) {
        CrossmapDetailEntity entity = new CrossmapDetailEntity();
        entity.setCrossmap(CrossmapEntity.findById(crossmapDetail.crossmapId));
        entity.setCrossmapField(crossmapDetail.crossmapField);
        entity.setDataAttribute(DataAttributeEntity.findById(crossmapDetail.dataAttributeId));
        entity.persistAndFlush();
        return mapDetailEntityToDTO(entity);
    }

    public List<CrossmapDetail> listCrossmapDetails(long crossmapId) {
        String query = "crossmapid = ?1";
        PanacheQuery<CrossmapDetailEntity> entities = CrossmapDetailEntity.find(query, crossmapId);
        return entities.stream().map(e -> mapDetailEntityToDTO(e)).collect(Collectors.toList());
    }

    @Transactional
    public void deleteCrossmapDetail(long detailId) {
        CrossmapDetailEntity.deleteById(detailId);
    }

    @Transactional
    public CrossmapDetail updateCrossmapDetail(long detailId, CrossmapDetail detail) {
        CrossmapDetailEntity entity = CrossmapDetailEntity.findById(detailId);
        if (detail.crossmapField != null)
            entity.setCrossmapField(detail.crossmapField);
        if (detail.dataAttributeId != 0)
            entity.setDataAttribute(DataAttributeEntity.findById(detail.dataAttributeId));
        if (detail.crossmapId != 0)
            entity.setCrossmap(CrossmapEntity.findById(detail.crossmapId));
        entity.persistAndFlush();
        return mapDetailEntityToDTO(entity);
    }

    public CrossmapDetail getCrossmapDetail(long crossmapDetailId) {
        CrossmapDetailEntity entity = CrossmapDetailEntity.findById(crossmapDetailId);
        return mapDetailEntityToDTO(entity);
    }

    protected Crossmap mapCrossmapEntityToDTO(CrossmapEntity e) {
        Crossmap crossmap = new Crossmap();
        crossmap.application = e.getApplication();
        crossmap.organization = e.getOrganization();
        crossmap.crossmapDesc = e.getCrossmapDesc();
        crossmap.crossmapId = e.getCrossmapId();
        crossmap.industryStd = e.getIndustryStd();
        return crossmap;
    }

    protected CrossmapDetail mapDetailEntityToDTO(CrossmapDetailEntity e) {
        CrossmapDetail detail = new CrossmapDetail();
        detail.crossmapDetailId = e.getCrossmapDetailId();
        detail.crossmapField = e.getCrossmapField();
        detail.crossmapId = e.getCrossmap().getCrossmapId();
        detail.dataAttributeId = e.getDataAttribute().getDataAttributeId();
        return detail;
    }
}
