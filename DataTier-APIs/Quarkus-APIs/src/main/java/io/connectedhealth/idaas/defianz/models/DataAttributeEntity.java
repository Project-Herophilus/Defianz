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
@Table(name = "refdata_dataattributes")
public class DataAttributeEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private int dataAttributeId;
    private String dataAttributeName;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private String createdUser;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "platformdataattributesid", nullable = false)
    public int getDataAttributeId() {
        return dataAttributeId;
    }

    public void setDataAttributeId(int dataAttributeId) {
        this.dataAttributeId = dataAttributeId;
    }

    @Basic
    @Column(name = "dataattributename", nullable = true, length = 50)
    public String getDataAttributeName() {
        return dataAttributeName;
    }

    public void setDataAttributeName(String name) {
        this.dataAttributeName = name;
    }

    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String user) {
        this.createdUser = user;
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
		return java.util.Objects.hash(dataAttributeId, dataAttributeName, createdUser, createdDate, status);
	}

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		DataAttributeEntity other = (DataAttributeEntity) o;
		return java.util.Objects.equals(dataAttributeId, other.dataAttributeId) &&
			java.util.Objects.equals(dataAttributeName, other.dataAttributeName) &&
            java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(createdDate, other.createdDate) &&
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
