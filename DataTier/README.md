Return to the <a href="https://github.com/Project-Herophilus/Defianz" target="_blank">Main Defianz Page</a>

# Defianz - Data Tier
This document is intented to specifically cover the data model. This platform now uses PostgreSQL, any version above
10.x has been used and we have not seen any issues currently. Additionally, our core efforts will also work to include
areas like SnowFlake (EDW) and eventually MongoDB as well.

# Data Tier - Overview
The following section covers various aspects of the data tier for Defianz. As you can imagine
building any amount of complexities into any system can make future enhancements too complex or
cause delays in feature functionality improvements in general. 

## Area of Data Coverage
We wanted to make sure that the table names were easy to understand and their names reflected their purpose. While
there is no easy pattern to leverage we tried to make the tablenames detailed enough to explain their purpose.
Below is our explanation about the current reusable pattern we are currently using
*{datapurpose_}tablepurpose*

| Data's Purpose        | Details                                                         |
|:----------------------|:----------------------------------------------------------------|
| crossmaps_(tablename) | Anything related to the crossmap activities within the platform |
| datamodel_(tablename) | Anything related to the platform                                |
| personidentities      | Person Identities                                               |
| refdata_(tablename)   | Reference Data                                                  |

## Describing the Tables Purpose and Meaning
We added a means to explain anything to the datamodel within the data itself. This was our catch all to ensure that
even if interpretation was wrong we would define the tables and all other datamodel aspects.

| Data Purpose         | Details                                                   |
|:---------------------|:----------------------------------------------------------|
| datamodel_domain     | Domains used in the data tier                             |
| datamodel_datatables | Detailed explanation of every table used in the data tier |
| datamodel_apis       | APIs explained by capability                              |
