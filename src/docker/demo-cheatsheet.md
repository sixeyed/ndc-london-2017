
## Setup 

Run the SQL Server container

```
docker run -d -p 1533:1433 -e sa_password=NDC_l0nd0n -e ACCEPT_EULA=Y --name sql-server --ip 172.31.118.118 microsoft/mssql-server-windows-express
```

# Demo - v2

```
.\build.ps1
docker-compose up -d
docker ps
dip docker_product-launch-web_1
docker logs docker_save-prospect-handler_1
docker exec docker_product-launch-db_1 powershell -Command "Invoke-SqlCmd -Query 'SELECT * FROM Prospects' -Database ProductLaunch"
docker top docker_message-queue_1
```

# Demo - v3

```
git checkout v3
.\build.ps1
docker-compose up -d
docker ps
dip docker_product-launch-web_1
docker logs docker_save-prospect-handler_1
docker exec docker_product-launch-db_1 powershell -Command "Invoke-SqlCmd -Query 'SELECT * FROM Prospects' -Database ProductLaunch"
docker top docker_message-queue_1
```


# Demo - v4

```
git checkout v4
.\build.ps1
docker-compose up -d
docker ps
dip docker_product-launch-web_1
docker logs docker_save-prospect-handler_1
docker logs docker_index-prospect-handler_1
dip docker_kibana_1
```