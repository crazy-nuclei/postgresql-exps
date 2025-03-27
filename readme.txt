run postgres in docker container : 
docker run --name postgres-container -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres

To connect, use extension : 
PostgreSQL by Chris Kolkman
