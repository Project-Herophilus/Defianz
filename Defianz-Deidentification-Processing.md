# Background


# Key Process
There are three key processes that this platform is intended to support and enable. Every key process and aspect of this system ties back to the iDaaS-KIC (Auditing) system. 

The key for the platform are: 
- Application: Source application where data is provided 
- Organization: Source Organization where data is provided
- Industry Std: Industry Std to leverage, this covers all scenarios including flat files
- Data Type / Message Type: This can be anything from a specific data type or message type (if industry stds are involved)
- PersonIdentity Attributes: Based on the implementation the specific data attributes combined to make a person identity. It can be changed at anytime; however, so will the generated metadata within the platform just making any existing personidentity invalid
- PersonIdentity: The generated internal value produced within the Defianz platform based on the personidentity attributes presented to the platform for value creation.
- Data Mappings: This is the mapping from source fields to target fields and needs to include the synthetic data attributes involved when the data is mapped.

## Creation of a Unique Idenifier for Input Data
This process deals with how the platform identifies data records presented to it. The Defianz platform first tier component before anything can be done within it is unique identification of input data.

1. The exposed API endpoint will take the following attributes: application, organization and all PersonIdentity Attributes (as one string)
2. A specific identifier will be produced and the platform will respond with that number to the requesting system. As part of this step the record will be audited to the iDaaS-KIC platform as an application integration event. 

## Relationship of Data for Processing

A seperate process that needs to be included in the platform is the ability to know what an implementation expects to have mapped. 
An example, is an organization named MCTN has implemented a system named MyMedicalRecord that sends HL7 v2 ADTs into the platform. In order for this system to be effective and also expansive for implementation needs the system has to use this information and pull back ALL the specifically mapped fields the implementation defined as PHI (Personal Health Information)/ PII (Peronal Identifiable Information) 

1.  An exposed API will take application, organization, industry std, data type and respond with all the fields that need to be remapped with specific deidentifiable data.

## Data Association to De-Identified Data
