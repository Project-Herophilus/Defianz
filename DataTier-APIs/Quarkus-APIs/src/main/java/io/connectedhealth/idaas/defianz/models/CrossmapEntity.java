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
@Table(name = "crossmaps")
public class CrossmapEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long crossmapId;
    private String organization;
    private String application;
    private String crossmapDesc;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private String industryStd;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "crossmapid", nullable = false)
    public long getCrossmapId() {
        return crossmapId;
    }

    public void setCrossmapId(long crossmapId) {
        this.crossmapId = crossmapId;
    }


    @Basic
    @Column(name = "crossmapdesc", nullable = true, length = 49)
    public String getCrossmapDesc() {
        return crossmapDesc;
    }

    public void setCrossmapDesc(String desc) {
        this.crossmapDesc = desc;
    }

    @Basic
    @Column(name = "organization", nullable = true, length = 38)
    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    @Basic
    @Column(name = "application", nullable = true, length = 38)
    public String getApplication() {
        return application;
    }

    public void setApplication(String application) {
        this.application = application;
    }

    @Basic
    @Column(name = "industryStd", nullable = true, length = 10)
    public String getIndustryStd() {
        return industryStd;
    }

    public void setIndustryStd(String std) {
        this.industryStd = std;
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
		return java.util.Objects.hash(crossmapId, crossmapDesc, organization, application,
					createdDate, industryStd, status);
	}

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		CrossmapEntity other = (CrossmapEntity) o;
		return java.util.Objects.equals(crossmapId, other.crossmapId) &&
            java.util.Objects.equals(crossmapDesc, other.crossmapDesc) &&
			java.util.Objects.equals(organization, other.organization) &&
            java.util.Objects.equals(application, other.application) && 
			java.util.Objects.equals(createdDate, other.createdDate) &&
			java.util.Objects.equals(industryStd, other.industryStd) && 
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
}
