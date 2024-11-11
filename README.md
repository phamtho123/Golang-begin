
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
   
## Usage

Once the dependencies are installed, you can start writing Go code that interacts with your PostgreSQL database using the `sqlc` tool to generate type-safe SQL code.