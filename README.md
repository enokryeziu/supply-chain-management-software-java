# Supply Chain Management Software (JAVA)

Desktop application build using JAVA Swing and MSSQL which includes functionality of managing users, purchase-order processing, inventory management, generate sales report etc 

## Getting Started

### Prerequisites

```
JDK 8 or newer
MSSQL
```

### Installing

1. Upload file to the directory of your choice.

```
git clone https://github.com/enokryeziu/supply-chain-management-software-java.git
```

2. Create a database and insert the SQL code

```
./SupplyChainManagement.sql
```

3. Edit **src\META-INF\persistence.xml** base on your configuration

```
<property name="javax.persistence.jdbc.url" value="jdbc:sqlserver://localhost:1433;databaseName=SupplyChainManagement"/>
<property name="javax.persistence.jdbc.user" value="sa"/>
<property name="javax.persistence.jdbc.driver" value="com.microsoft.sqlserver.jdbc.SQLServerDriver"/>
<property name="javax.persistence.jdbc.password" value="sa"/>
```

## Version
```
Version 2018
```
