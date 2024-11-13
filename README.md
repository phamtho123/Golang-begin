
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

3. **Clear Dependencies**

   Clean up unused dependencies:

   ```bash
   go mod tidy
   ```

4. **Install Testing Framework**

   Install the `stretchr/testify` package for unit testing:

   ```bash
   go get github.com/stretchr/testify
   ```

5. **Database**

   Access the database terminal:

   ```bash
   docker exec -it postgres12 psql -U root -d simple_bank
   ```

   Create a new migration:

   ```bash
   migrate create -ext sql -dir db/migration -seq add_users
   ```

6. **Gin**

   Install Gin for building RESTful APIs:

   ```bash
   go get -u github.com/gin-gonic/gin
   ```

7. **Viper**

   Install Viper for loading configuration and environment variables:

   ```bash
   go get github.com/spf13/viper
   ```

8. **Mock**

   Install mockgen for mock testing:

   ```bash
   go install github.com/golang/mock/mockgen@v1.6.0
   ```

   Generate mock store:

   ```bash
   mockgen -destination db/mock/store.go github.com/techschool/simplebank/db/sqlc Store
   ```

9. **JWT and UUID Libraries**

   Install UUID for unique identifiers:

   ```bash
   go get github.com/google/uuid
   ```

   Install JWT for token management:

   ```bash
   go get github.com/dgrijalva/jwt-go
   ```

   Install Paseto:

   ```bash
   go get github.com/o1egl/paseto
   ```

10. **Docker**

    Build the Docker image:
    
    ```bash
    sudo docker build -t simplebank:latest .
    ```
    
    Check Docker images:
    
    ```bash
    sudo docker images
    ```
    
    Delete a Docker image:
    
    ```bash
    sudo docker rmi <image-id>
    ```
    
    Run the Docker image:
    
    ```bash
    sudo docker run --name simplebank -p 8080:8080 simplebank:latest
    ```
    
    Run the Docker image with production mode:
    
    ```bash
    sudo docker run --name simplebank -p 8080:8080 -e GIN_MODE=release simplebank:latest
    ```
    
    Run Docker with database source configuration:
    
    ```bash
    sudo docker run --name simplebank -p 8080:8080 -e GIN_MODE=release    -e DB_SOURCE="postgresql://root:root@172.17.0.2:5432/simple_bank?sslmode=disable"    simplebank:latest
    ```
    
    Run Docker with custom network:
    
    ```bash
    sudo docker run --name simplebank --network bank-network -p 8080:8080 -e GIN_MODE=release    -e DB_SOURCE="postgresql://root:root@postgres12:5432/simple_bank?sslmode=disable"    simplebank:latest
    ```
    
    Check all containers:
    
    ```bash
    sudo docker ps -a
    ```
    
    Delete a container:
    
    ```bash
    sudo docker rm <container-name>
    ```
    
    Inspect container info:
    
    ```bash
    sudo docker container inspect postgres12
    ```
    
    List Docker networks:
    
    ```bash
    sudo docker network ls
    ```
    
    Inspect a Docker network:
    
    ```bash
    sudo docker network inspect bridge
    ```
    
    Create a Docker network:
    
    ```bash
    sudo docker network create <network-name>
    ```
    
    Connect a container to a network:
    
    ```bash
    sudo docker network connect bank-network postgres12
    ```

11. **Assign permission**

    ```bash
    chmod +x wait-for.sh
    ```
## Usage

Once the dependencies are installed, you can start writing Go code that interacts with your PostgreSQL database using the `sqlc` tool to generate type-safe SQL code.

---