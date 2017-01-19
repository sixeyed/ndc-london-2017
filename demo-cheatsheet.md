
# Setup - v1

Setup

```
git checkout -f v1
.\reset.ps1
```

Ctrl-F5 in VS

# Demo - v2

Setup

```
git checkout -f v2
.\reset.ps1
```

Start database

```
docker run -d -p 1533:1433 `
 -e sa_password=NDC_l0nd0n -e ACCEPT_EULA=Y `
 --name sql-server `
 microsoft/mssql-server-windows-express
```

Build & run website

```
.\build.ps1
docker run -d -p 80:80 `
 --name web `
  sixeyed/product-launch-web:v2
```

Check website
```
docker inspect web
docker top web
```

Query database
```
docker exec sql-server `
 powershell -Command `
  "Invoke-SqlCmd -Query 'SELECT * FROM Prospects' -Database ProductLaunch"
```

# Demo - v3

Setup

```
git checkout -f v3
.\reset.ps1
.\build.ps1
```

Run 

```
docker-compose up -d
docker inspect docker_product-launch-web_1
docker logs docker_save-prospect-handler_1
```

Fill out form

```
docker logs docker_save-prospect-handler_1

docker exec docker_product-launch-db_1 `
 powershell -Command `
 "Invoke-SqlCmd -Query 'SELECT * FROM Prospects' -Database ProductLaunch"

docker top docker_message-queue_1
```


# Demo - v4

```
git checkout -f v4
.\build.ps1
```

Run 

```
docker-compose up -d
docker inspect docker_product-launch-web_1
```

Browse, then run SpecFlow

```
docker logs docker_save-prospect-handler_1
docker logs docker_index-prospect-handler_1
docker inspect docker_kibana_1
```

Discover & visualize

# Demo - v5

```
git checkout -f v5
.\build.ps1
```

Run 

```
docker-compose up -d
docker inspect docker_product-launch-web_1
```

Submit form, then update Discover in Kibana