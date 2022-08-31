# Quarkus APIs
This is a Quarkus application (https://quarkus.io/). The API sets provide methods to manage crossmap definitions
as well as the main method to de-identify a person.

## Prerequisites
- A running instance of datasynthesis application (https://github.com/Project-Herophilus/DataSynthesis/tree/main/DataTier-APIs/Quarkus-APIs).
- Postgresql database created with loaded schema and seeded table refdata_dataattributes.

## Locally Running: Maven Command
You can start the entire platform from a command line through Maven. In order to do this you will need to know 
the key database details: database host address, port, username and password. Also you need to know how to access
the datasynthesis API service.

1. The following environment variable can be set before you run the mvn command or start the container in openshift

| Attribute                                         | Environment variable and sample value |
|---------------------------------------------------|---------------------------------------|
| Avoid Recreating the datamodel and overwriting it | MIGRATE_DATABASE=false |
| Database Name                                     | DATABASE_NAME=dev_defianz |
| Database Host (Name or IP)                        | DATABASE_HOST=192.168.1.101 |
| Database User Name                                | DATABASE_USERNAME=postgres |
| Database Password                                 | DATABASE_PASSWORD=MyData |
| Database Port                                     | DATABASE_PORT=5432  |
| API Service Port                                  | SERVICE_PORT=8080 |
| Datasynthesis API URL                             | DATASYNTHESIS_URL=http://192.168.1.102:8999 |
| Enable Auditing                                   | ENABLE_AUDITING=true |
| Auditing API URL                                  | AUDITING_URL=http://192.168.1.103:9970 |


2. The following command specifically shows you how to start the Quarkus APIs. The following command 
will start up the Quarkus APIs, Connect to a specific PostgresQL Database, sip all the developed tests and 
not validate the datamodel. You will notice there is a -D before every command, this is not a typo but
a way that specifically defines attributes. This is absolutely critical so that the application.properties
file can accept the specific attributes and their values. You don't need to set the -D option if it has been
set through the environment variable or you accept the default value in the application properties file.

| Attribute                                         | Attribute Value|
|---------------------------------------------------|----------------|
| Avoid Recreating the datamodel and overwriting it | -DMIGRATE_DATABASE=false |
| Database Name                                     | -DDATABASE_NAME=dev_datasynthesis |
| Database Host (Name or IP)                        | -DDATABASE_HOST=192.168.1.101 |
| Database User Name                                | -DDATABASE_USERNAME=postgres |
| Database Password                                 | -DDATABASE_PASSWORD=MyData |
| Database Port                                     | -DDATABASE_PORT=5432  |
| API Service Port                                  | -DSERVICE_PORT=8080 |
| Datasynthesis API URL                             | -DDATASYNTHESIS_URL=http://192.168.1.102:8999 |
| Skip Tests                                        | -DskipTests |
| No DataModel Validation                           | -Dquarkus.hibernate-orm.validate-in-dev-mode=false|
```
mvn quarkus:dev -Dquarkus.liquibase.migrate-at-start=false -DDATABASE_NAME=dev_datasynthesis 
-DSERVICE_PORT=8080 -DDATABASE_HOST=192.168.1.101 -DDATABASE_USERNAME=postgres 
-DDATABASE_PASSWORD=MyData -DDATABASE_PORT=5432 -DskipTests -Dquarkus.hibernate-orm.validate-in-dev-mode=false
-DDATASYNTHESIS_URL=http://192.168.1.102:8999
```

3. Verify the API service starts healthily you can use your browser to visit http://localhost:8080/swagger.
It opens the swagger UI and shows all available APIs. You can directly test the APIs through hte swagger UI.

## How to use the API with examples
1. Create a crossmap
```
POST http://localhost:8080/api/v1/crossmaps
{
    "crossmapDesc": "A crossmap",
    "industryStd": "healthcare",
    "organization": "ACME",
    "application": "app"
}
```
`organization` and `application` joint together to uniquely identify a crossmap.
You can also GET/DELETE/PATCH a crossmap using the APIs.

2. Create multiple crossmap details belonging to a crossmap
```
POST http://localhost:8080/api/v1/crossmap_details
{
    "crossmapId": 1,
    "crossmapField": "PV1.7.1",
    "dataAttributeId", 15
}
POST http://localhost:8080/api/v1/crossmap_details
{
    "crossmapId": 1,
    "crossmapField": "PV1.7.2",
    "dataAttributeId", 1
}
POST http://localhost:8080/api/v1/crossmap_details
{
    "crossmapId": 1,
    "crossmapField": "PV1.7.3",
    "dataAttributeId", 20
}
```
A crossmap_detail maps a customer field `crossmapField` to a data model represented
by `dataAttributeId` in Data Synthesis datastore. You can get a list of all available
data attributes using API
```
GET http://localhost:8080/api/v1/dataattributes
```
sample output
```
  {
    "dataAttributeId": 1,
    "dataAttributeName": "Names - Last",
    "endpoint": "lastnames"
  }
```
The output also includes an endpoint slug that can be used to fetch synthesis data using
the DataSynthesis API.

Here is the complete list of all data attribute names:
* Account NUmber
* Address
* Area Code
* Bank Account
* Bank Routing
* Company Name
* Credit Card
* Date of Birth
* Drivers License Number
* Employer Identification Number
* Name - First
* Name - Last
* Phone Number
* Social Security Number
* UPC Code
* User Identity
* US Zip Code
You can also GET/DELETE/PATCH a crossmap_details using the APIs.

3. Create actual mapping for a person
```
POST http://localhost:8080/api/v1/person-crossmaps
{
    "application": "app",
    "organization": "ACME",
    "identifiers": {
        "account": 12345,
        "region": "us"
    }
}
```
sample output
```
[
  {
    "crossmapField": "PV1.7.2",
    "dataAttributeId": 1,
    "dataValueId": 15
  },
  {
    "crossmapField": "PV1.7.1",
    "dataAttributeId": 15,
    "dataValueId": 2701
  },
  {
    "crossmapField": "PV1.7.3",
    "dataAttributeId": 20,
    "dataValueId": 2982
  }
]
```
Input `application` and `organization` are used to identify the crossmap and all
associated crossmap_details. `identifiers` can be any json formatted key-value
pairs to identify a person. Identifies are never stored in the database. They are
instead translated in a hash value and persisted. If the hash value is new to the
database random synthesis data are pulled into the map and persisted; otherwise 
previous fetched data are directly returned.

The sample output entry
```
  {
    "crossmapField": "PV1.7.2",
    "dataAttributeId": 1,
    "dataValueId": 15
  }
```
maps customer field `PV1.7.2` into synthesis model `Name - Last` (dataAttributeId=1)
with id `15` (dataValueId=15). You can use DataSynthesis API service to get the actual
synthesis data
```
GET http://192.168.1.102:8999/api/v1/lastname/15
```
sample output
```
{
  "id": 15,
  "lastName": "Aaberg"
}
```
