package io.connectedhealth.idaas.defianz.models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "crossmaps_dtl")
public class CrossmapDetailEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long crossmapDetailId;
    private String crossmapField;
    private Timestamp createdDate;
    private CrossmapEntity crossmap;
    private DataAttributeEntity dataAttribute;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "crossmapdtlid", nullable = false)
    public long getCrossmapDetailId() {
        return crossmapDetailId;
    }

    public void setCrossmapDetailId(long crossmapDetailId) {
        this.crossmapDetailId = crossmapDetailId;
    }


    @Basic
    @Column(name = "crossmapfield", nullable = false, length = 20)
    public String getCrossmapField() {
        return crossmapField;
    }

    public void setCrossmapField(String field) {
        this.crossmapField = field;
    }

    @Basic
    @CreationTimestamp
    @Column(name = "createddate", nullable = true)
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public int hashCode() {
		return java.util.Objects.hash(crossmapDetailId, crossmapField, crossmap,
					createdDate, dataAttribute, status);
	}

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		CrossmapDetailEntity other = (CrossmapDetailEntity) o;
		return java.util.Objects.equals(crossmapDetailId, other.crossmapDetailId) &&
			java.util.Objects.equals(crossmapField, other.crossmapField) &&
			java.util.Objects.equals(createdDate, other.createdDate) &&
			java.util.Objects.equals(crossmap, other.crossmap) &&
            java.util.Objects.equals(dataAttribute, other.dataAttribute) && 
			java.util.Objects.equals(status, other.status);
	}

    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "statusid")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    @ManyToOne
    @JoinColumn(name = "crossmapid", referencedColumnName = "crossmapid")
    public CrossmapEntity getCrossmap() {
        return crossmap;
    }

    public void setCrossmap(CrossmapEntity crossmap) {
        this.crossmap = crossmap;
    }

    @ManyToOne
    @JoinColumn(name = "dataattributeid", referencedColumnName = "platformdataattributesid")
    public DataAttributeEntity getDataAttribute() {
        return dataAttribute;
    }

    public void setDataAttribute(DataAttributeEntity dataAttribute) {
        this.dataAttribute = dataAttribute;
    }
}
