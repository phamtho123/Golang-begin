
# Project Setup

## Prerequisites

Before setting up the project, make sure you have the following installed:

- **Go**: Install the latest version of Go [here](https://golang.org/dl/).
- **Snap** (for installing sqlc)

## Steps to Set Up

1. **Install SQLC**

   SQLC is a tool that generates Go code from SQL queries. It simplifies the integration between Go and SQL, allowing you to write type-safe SQL code in Go.

   To install `sqlc`, run the following command:

   ```bash
   sudo snap install sqlc
   ```

    - `snap`: A package management system for installing applications.
    - `install`: The subcommand used to install packages.
    - `sqlc`: The specific package you are installing.

2. **Install PostgreSQL Driver**

   To enable Go to interact with PostgreSQL databases, you need to install the `lib/pq` package, which is a pure Go driver for PostgreSQL.

   Run this command to install the package:

   ```bash
   go get github.com/lib/pq
   ```

    - `go get`: A Go command used to download and install the specified package.
    - `github.com/lib/pq`: The PostgreSQL driver package.

3. **Clear**
   ```bash
   go mod tidy
   ```

4. **Test**
   ```bash
   go get github.com/stretchr/testify
   ```

5. **DB**

   Exec to terminal DB
   ```bash
   docker exec -it postgres12 psql -U root -d simple_bank
   ```
   create new migrate
   ```bash
   migrate create -ext sql -dir db/migration -seq add_users
   ```

6. **Gin**

   Restfull api
   ```bash
   go get -u github.com/gin-gonic/gin
   ```

7. **Viper**

   Load config and env
   ```bash
   go get github.com/spf13/viper
   ```

8. **Mock**

   Mock testing
   ```bash
   go install github.com/golang/mock/mockgen@v1.6.0
   ```
   Render store
   ```bash
   mockgen -destination db/mock/store.go github.com/techschool/simplebank/db/sqlc Store
   ```

9. **Token JWT**

   Install uuid by go
   ```bash
   go get github.com/google/uuid
   ```
   Install jwt
   ```bash
   go get github.com/dgrijalva/jwt-go
   ```
   Install paseto
    ```bash
   go get github.com/o1egl/paseto
      ```

10. **Docker**
   Build image
   ```bash
   sudo docker build -t simplebank:latest .
   ```
   check images
   ```bash
   sudo docker images
   ```
   delete image
    ```bash
    sudo rmi <id image> 
      ```
   run docker images
    ```bash
    sudo docker run --name simplebank -p 8080:8080 simplebank:latest
    ```
   run docker images
    ```bash
    sudo docker run --name simplebank -p 8080:8080 -e GIN_MODE=release simplebank:latest
    ```
   run docker images
    ```bash
    sudo docker run --name simplebank -p 8080:8080 -e GIN_MODE=release
    -e DB_SOURCE="postgresql://root:root@172.17.0.2:5432/simple_bank?sslmode=disable"
    simplebank:latest
    ```
   
   run docker images
    ```bash
    sudo docker run --name simplebank --network bank-network -p 8080:8080 -e GIN_MODE=release
    -e DB_SOURCE="postgresql://root:root@postgres12:5432/simple_bank?sslmode=disable"
    simplebank:latest
    ```
   
   check all container
    ```bash
    sudo docker ps -a
    ```
   
   delete container
    ```bash
    sudo docker rm <name container>
    ```
   
   check info container
    ```bash
    sudo docker container inspect postgres12
    ```
   
   list network docker 
    ```bash
    sudo docker network ls
    ```
   
   inspect network
    ```bash
    sudo docker network inspect bridge
    sudo docker container inspect postgres12
    ```
   
   create network
    ```bash
    sudo docker network create <name-network>
    ```
   
   help connect to network
    ```bash
    sudo docker network connect --help
    ```
   
   connect to bank-network
    ```bash
    sudo docker network connect bank-network postgres12
    ```
## Usage

Once the dependencies are installed, you can start writing Go code that interacts with your PostgreSQL database using the `sqlc` tool to generate type-safe SQL code.
