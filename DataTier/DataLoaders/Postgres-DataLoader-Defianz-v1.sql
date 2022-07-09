# psql h localhost -U postgres -d datasynthesis -p 5432 -f file.sql
# "C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/1-refdata_status.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataFiles/refdata_status.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataFiles/refdata_dataattributes.sql

