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
@Table(name = "personidentity")
public class PersonIdentityEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long personIdentityId;
    private String organization;
    private String application;
    private String sha256;
    private Timestamp createdDate;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "personidentityid", nullable = false)
    public long getPersonIdentityId() {
        return personIdentityId;
    }

    public void setPersonIdentityId(long personIdentityId) {
        this.personIdentityId = personIdentityId;
    }


    @Basic
    @Column(name = "sha256", nullable = true, length = 64)
    public String getSha256() {
        return sha256;
    }

    public void setSha256(String sha256) {
        this.sha256 = sha256;
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
		return java.util.Objects.hash(personIdentityId, organization, application,
					createdDate, sha256, status);
	}

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		PersonIdentityEntity other = (PersonIdentityEntity) o;
		return java.util.Objects.equals(personIdentityId, other.personIdentityId) &&
			java.util.Objects.equals(organization, other.organization) &&
            java.util.Objects.equals(application, other.application) && 
			java.util.Objects.equals(createdDate, other.createdDate) &&
			java.util.Objects.equals(sha256, other.sha256) && 
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

    public static List<PersonIdentityEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
