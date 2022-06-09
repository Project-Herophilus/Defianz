# Background
This document is intended to document the process and key defintions around the practices and processes needed within Defianz for data de-identitifcation.

# Key Terms and Definitions
The key definitions for the platform are:

- Application: Source application where data is provided 
- Organization: Source Organization where data is provided
- Industry Std: Industry Std to leverage, this covers all scenarios including flat files
- Data Type / Message Type: This can be anything from a specific data type or message type (if industry stds are involved)
- PersonIdentity Attributes: Based on the implementation the specific data attributes combined to make a person identity. It can be changed at anytime; however, so will the generated metadata within the platform just making any existing personidentity invalid
- PersonIdentity: The generated internal value produced within the Defianz platform based on the personidentity attributes presented to the platform for value creation.
- Data Mappings: This is the mapping from source fields to target fields and needs to include the synthetic data attributes involved when the data is mapped.

# Data Processing Steps
There are three key processes that this platform is intended to support and enable. Every key process and aspect of this system ties back to the iDaaS-KIC (Auditing) system. 

## Creation of a Unique Idenifier for Input Data
This process deals with how the platform identifies data records presented to it. The Defianz platform first tier component before anything can be done within it is unique identification of input data. <b> This is represented in the defianz data model in the table: personidentity </b>.

<b> If anything changes in the implementation and the data sent it the key created will be DIFFERENT and this process will produce a different identifier and all information produced by this API will be unique </b>
1. The exposed API endpoint will take the following attributes: application, organization and all PersonIdentity Attributes (as one string)
2. A specific identifier will be produced and the platform will respond with that number to the requesting system. 

## Relationship of Data for Processing
The ability to know what an implementation expects to have mapped to synthetic data. This provides the system to know and understand what specific data is being re-mapped. <b> This is represented in the defianz data model in the table: crossmap_dtl </b>.

Example: An organization named MCTN has implemented a system named MyMedicalRecord that sends HL7 v2 ADTs into the platform. In order for this system to be effective and extensible means that the implementation  has to use this information and pull back ALL the specifically mapped fields the implementation defined as PHI (Personal Health Information)/ PII (Peronal Identifiable Information) 

Example: An exposed API will take application, organization, industry std, data type and respond with all the fields that need to be remapped with specific deidentifiable data.

1.  PID.2 will use AccountNumber
2.  PID.3 will use AccountNumber
3.  PV1.7.1 will use IdentifierCode
4.  PV1.7.2 will use LastName
5.  PV1.7.3 will use FirstName
6.  PV1.8.1 will use IdentifierCode
7.  PV1.8.2 will use LastName
8.  PV1.8.3 will use FirstName
9.  PV1.9.1 will use IdentifierCode
10. PV1.9.2 will use LastName
11. PV1.9.3 will use FirstName
  
## Detailed Data Element Association to De-Identified Data
The key second data step will be used by the platform to carry the specific data and we will then create a specific platform data attribute and pull the specific record for the specific attribute that will be used permanently. If NONE exist then records will be premamently created.
