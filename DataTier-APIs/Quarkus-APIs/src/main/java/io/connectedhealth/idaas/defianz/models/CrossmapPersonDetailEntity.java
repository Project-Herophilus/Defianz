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

@Entity
@Table(name = "crossmaps_person_dtl")
public class CrossmapPersonDetailEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long crossmapPersonDetailId;
    private long dataValueId;
    private Timestamp createdDate;
    private PersonIdentityEntity personIdentity;
    private CrossmapDetailEntity crossmapDetail;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "crossmapspersondtlid", nullable = false)
    public long getCrossmapsPersonDetailId() {
        return crossmapPersonDetailId;
    }

    public void setCrossmapsPersonDetailId(long crossmapPersonDetailId) {
        this.crossmapPersonDetailId = crossmapPersonDetailId;
    }


    @Basic
    @Column(name = "keydatavalueid", nullable = false)
    public long getDataValueId() {
        return dataValueId;
    }

    public void setDataValueId(long dataValueId) {
        this.dataValueId = dataValueId;
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
		return java.util.Objects.hash(crossmapPersonDetailId, dataValueId, personIdentity,
					createdDate, crossmapDetail, status);
	}

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		CrossmapPersonDetailEntity other = (CrossmapPersonDetailEntity) o;
		return java.util.Objects.equals(crossmapPersonDetailId, other.crossmapPersonDetailId) &&
			java.util.Objects.equals(dataValueId, other.dataValueId) &&
			java.util.Objects.equals(createdDate, other.createdDate) &&
			java.util.Objects.equals(personIdentity, other.personIdentity) &&
            java.util.Objects.equals(crossmapDetail, other.crossmapDetail) && 
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
    @JoinColumn(name = "personidentityid", referencedColumnName = "personidentityid")
    public PersonIdentityEntity getPersonIdentity() {
        return personIdentity;
    }

    public void setPersonIdentity(PersonIdentityEntity personIdentity) {
        this.personIdentity = personIdentity;
    }

    @ManyToOne
    @JoinColumn(name = "crossmapsdtlid", referencedColumnName = "crossmapdtlid")
    public CrossmapDetailEntity getCrossmapDetail() {
        return crossmapDetail;
    }

    public void setCrossmapDetail(CrossmapDetailEntity crossmapDetail) {
        this.crossmapDetail = crossmapDetail;
    }
}
