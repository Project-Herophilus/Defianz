Return to the <a href="https://github.com/Project-Herophilus" target="_blank">Main GitHub Org. Site</a>

# Background
De-identification and anonymization are becoming more and more critical for organizations. Because 
healthcare is a highly regulated industry the government has defined a specific series of
[standards](https://www.hhs.gov/hipaa/for-professionals/privacy/special-topics/de-identification/index.html) that
provide direction and specific direction.  

To help improve implementtation needs we have developed Defianz. Its intent 
is to enable de-identification and anonymization activities with data.

# Platform
There are three key processes that this platform is intended to support and enable. Every key process and aspect of this system ties back to the iDaaS-KIC (Auditing) system.

## Key Terms and Definitions
The key terminologies and definitions for the platform are:

- Application: Source application where data is provided 
- Organization: Source Organization where data is provided
- Industry Std: Industry Std to leverage, this covers all scenarios including flat files
- Data Type / Message Type: This can be anything from a specific data type or message type (if industry stds are involved)
- PersonIdentity Attributes: Based on the implementation the specific data attributes combined to make a person identity. 
It can be changed at anytime; however, so will the generated metadata within the platform just making any existing personidentity invalid
- PersonIdentity: The generated internal value produced within the Defianz platform based on the personidentity attributes 
presented to the platform for value creation.
- Cross Data Mappings: This is the mapping from source fields to target fields and needs to include the synthetic data attributes 
involved when the data is mapped.

## Key Processes
The following are key Defianz processes.

* Person Identities: Creation of a Unique Idenifier for Input Data
The first tier component in the Defianz platform is to create a unique identificatier for any persons data passing through it.
This process deals with how the platform identifies data records presented to it. 
  * The exposed API endpoint will take the following specific implementataion defined attributes: application, organization and 
  all Person Identity attributes (as one specific string) which the API creates a specific mathematical value for. While the 
  platform persists the application and organization values it only persists the created mathmatical value created from all
  the values sent in. 
  <b> If anything changes in the implementation including something as small as extra spaces or adding new data elements 
  the key created will be DIFFERENT and this process will produce a different identifier and any existing relationships will not
  exist </b>
* Cross Data Mappings: Involve three key aspects
  * Record Identifier: This is done by a user through the web interface and intended to be a place for all activities
  related to a specific application and organization.
  * Record Identifier Mapping: This is user driver so the platform know what specific fields in the data stream
  will be mapped to what specific data attribute the platform has.
  * Data Association: This is done by the API based on the record identifer mapping and some logic. The
    mapping tells the platform what data attributes to use and the API goes and retrieves random data to complete
    the request. The values (not the specific data) are then persisted to meet the mapping requirements.
    * If there is NO data associattion the platform will go and get the needed data to fulfill the mapping requirement 
    and persist the ids of what it retrieved for future consistency and reuse. If there is data associated the API simply 
    returns the data

## Defianz Philosophy

Defianz has always intended to be operated under the open/community source model. DataSynthesis open source
licensing model is <a href="https://opensource.org/licenses/Apache-2.0" target="_blank">Apache-2.0</a>.
Our model is not some "freemium" or offering based model with versions and scaled capabilities. Our approach is
to provide the assets and have community enhancements and improvements to support the growth of underlying needs for the
platform. data access capabilities. The core assets provided include a highly flexible and extensible data
tier, APIs that both enable the platform to be accessed as well as extended and at some point there will be a
WebUI.

# Defianz: Getting More Familiar
Defianz consists of three core modules - data, apis, and a web interface.

| Area | Sub-Module                                                                                              | 
|------|---------------------------------------------------------------------------------------------------------|
| Data | [DataTier](https://github.com/Project-Herophilus/Defianz/tree/main/DataTier/README.md)                  | 
| APIs | [DataTier APIs](https://github.com/Project-Herophilus/Defianz/tree/main/DataTier-APIs/README.md)        |
| User Interface | [DataTier Web User Interfaces](https://github.com/Project-Herophilus/Defianz/tree/main/WebUI/README.md) |


*Enjoy and Happy Coding!!!*

