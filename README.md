# 🐾 Petfinder API Automation Testing

![Java](https://img.shields.io/badge/Java-22-orange?style=for-the-badge\&logo=openjdk\&logoColor=white)
![Rest Assured](https://img.shields.io/badge/REST%20Assured-5.5.6-green?style=for-the-badge)
![Cucumber](https://img.shields.io/badge/Cucumber-BDD-23d96c?style=for-the-badge\&logo=cucumber\&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-Build%20Tool-C71A36?style=for-the-badge\&logo=apachemaven\&logoColor=white)
![JUnit](https://img.shields.io/badge/JUnit-Testing-25A162?style=for-the-badge\&logo=junit5\&logoColor=white)
![Git](https://img.shields.io/badge/Git-Version%20Control-F05032?style=for-the-badge\&logo=git\&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge\&logo=github\&logoColor=white)

## 📌 About The Project

This project is a **REST API automation testing framework** developed using **Java, REST Assured, Cucumber, JUnit, and Maven**.

The project automates API tests against the **Petfinder API**, focusing on authentication, response status-code validation, and response-body validation.

Both **positive and negative API scenarios** are covered to verify the behavior of the API for authenticated and unauthenticated users.

---

## 🎯 Project Objectives

The main objectives of this project are to demonstrate:

* 🔐 API authentication using OAuth 2.0
* 🚀 REST API automation using REST Assured
* 🧪 Positive and negative API testing
* 📊 HTTP response status-code validation
* 🔎 JSON response-body validation
* 🥒 Behavior Driven Development (BDD) using Cucumber
* 📄 Automated test reporting
* 📦 Maven-based dependency and test execution

---

## 🛠️ Tech Stack

| Technology          | Purpose                                 |
| ------------------- | --------------------------------------- |
| ☕ **Java**          | Programming language                    |
| 🔗 **REST Assured** | REST API automation                     |
| 🥒 **Cucumber**     | BDD test scenarios                      |
| 🧪 **JUnit**        | Test execution and assertions           |
| 📦 **Maven**        | Build & dependency management           |
| 🔐 **OAuth 2.0**    | API authentication                      |
| 🐙 **Git / GitHub** | Version control & repository management |
| 📄 **JSON**         | API response parsing                    |

---

## 🔌 API Under Test

This project uses the **Petfinder API**.

### Base URL

```text
https://api.petfinder.com/v2
```

### Endpoint Tested

```http
GET /types
```

The `/types` endpoint returns animal types available through the Petfinder API.

Authentication is performed using the OAuth 2.0 token endpoint:

```http
POST /oauth2/token
```

---

## 🔐 Authentication Flow

The automation framework follows this flow:

```text
                 ┌─────────────────────┐
                 │     Test Scenario   │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ Request OAuth Token │
                 │   POST /oauth2/token│
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │    Access Token     │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ GET /types          │
                 │ Authorization:      │
                 │ Bearer <token>      │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ Validate Response   │
                 │ Status + JSON Body  │
                 └─────────────────────┘
```

---

## 🧪 Test Scenarios

The project currently covers the following scenarios.

### ✅ Positive Scenarios

**1. Validate successful response status**

```gherkin
Scenario: Validation of positive response code for animals from the Application
  Given I am an authenticated user
  When I hit the get animals API URL
  Then I get 200 as the response code
```

**2. Validate response body**

```gherkin
Scenario: Validation of positive response body animals from the Application
  Given I am an authenticated user
  When I hit the get animals API URL
  Then I get animals in the response body of the API
```

The response is validated to ensure the expected animal type is returned.

---

### ❌ Negative Scenarios

**3. Validate unauthorized response**

```gherkin
Scenario: Validation of negative response code for animals from the Application
  Given I am an unauthenticated user
  When I hit the get animals API URL
  Then I get 401 as the response code
```

**4. Validate unauthorized response body**

The API response is also validated to ensure an unauthorized request does not return the expected animal data.

---

## 📂 Project Structure

```text
APITestRestAssuredSecure
│
├── src
│   ├── main
│   │   └── java
│   │       └── org
│   │           └── example
│   │               └── App.java
│   │
│   └── test
│       └── java
│           │
│           ├── features
│           │   └── GetAnimals.feature
│           │
│           ├── runner
│           │   └── TestRunner.java
│           │
│           ├── stepDefinitions
│           │   └── Animals.java
│           │
│           └── org
│               └── example
│                   └── AppTest.java
│
├── pom.xml
├── .gitignore
└── README.md
```

### 📄 Key Components

**`GetAnimals.feature`**

Contains the BDD scenarios written in Gherkin syntax.

**`Animals.java`**

Contains the step definitions and REST Assured API automation logic.

**`TestRunner.java`**

Configures and executes the Cucumber test scenarios.

**`pom.xml`**

Manages project dependencies such as REST Assured, Cucumber and JUnit.

---

## ⚙️ Setup & Installation

### 1️⃣ Clone the repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
```

### 2️⃣ Open the project

Open the project using an IDE such as:

* IntelliJ IDEA
* Eclipse

### 3️⃣ Verify Java

This project uses Java 22.

```bash
java -version
```

### 4️⃣ Install Maven dependencies

Run:

```bash
mvn clean install
```

---

## ▶️ Running the Tests

Run the complete test suite using:

```bash
mvn test
```

You can also execute the `TestRunner` class directly from your IDE.

---

## 📊 Test Reports

Cucumber generates test reports during execution.

The HTML report can be found under:

```text
target/cucumber-html-report
```

A JSON report is also generated:

```text
cucumber.json
```

These reports provide information about:

* Test scenarios
* Passed scenarios
* Failed scenarios
* Step execution
* Test execution results

---

## 🔍 What This Project Demonstrates

This project demonstrates practical knowledge of:

### REST API Testing

* GET requests
* POST requests
* HTTP status codes
* Request headers
* Request parameters
* Response validation

### Authentication

* OAuth 2.0 authentication
* Access-token generation
* Bearer-token authorization

### JSON Validation

* JSONPath
* Extracting values from JSON responses
* Response-body validation

### BDD

* Feature files
* Given / When / Then
* Cucumber step definitions
* Cucumber test runner

### Automation Framework

* REST Assured
* Maven
* JUnit
* Cucumber
* Reusable API test steps

---

## 🔒 Security Note

**API credentials should never be committed to source control.**

For local execution, store sensitive credentials using environment variables rather than hard-coding them in Java source files.

Example:

```java
String clientId = System.getenv("PETFINDER_CLIENT_ID");
String clientSecret = System.getenv("PETFINDER_CLIENT_SECRET");
```

Then configure the environment variables locally before running the tests.

> ⚠️ If credentials were previously committed to a public GitHub repository, revoke/rotate them even if they are removed in a later commit.


---

## 📚 Learning Outcomes

Through this project, I gained practical experience in:

* REST API automation
* REST Assured
* OAuth authentication
* API authorization
* JSONPath
* Cucumber BDD
* JUnit
* Maven
* Positive and negative API testing
* API response validation
* Test reporting
* Secure handling of API credentials

---

## 👨‍💻 Author

**Shan Gunarathne**

QA Engineer | Software Testing | Automation Testing

### 💻 Skills

`Manual Testing` • `API Testing` • `API Automation` • `Selenium` • `Java` • `REST Assured` • `Cucumber` • `SQL` • `Postman` • `JMeter`

---

⭐ **If you find this project useful, feel free to star the repository!**
