**SauceDemo Robot Framework Automation**
This project is an end-to-end UI automation framework for the SauceDemo application using Robot Framework and Browser Library, which is built on top of Playwright. The framework is designed with reusable keywords, page-level resources, test data generation, and CI/CD execution using GitHub Actions.

**Tech Stack**
Robot Framework
Robot Framework Browser Library
Playwright
Python
Pabot – parallel test execution
Faker Library – dynamic test data
GitHub Actions – CI/CD

**Framework Structure**
├── .github/workflows/   # CI/CD pipeline
├── page/                # Page-specific keywords and locators
├── resource/            # Common reusable keywords
├── tests/               # Test cases
├── requirements.txt     # Project dependencies
└── README.md

**Test Coverage**
Login
Product listing
Product sorting
Add/remove products from cart
Cart validation
Checkout flow

**Key Features**
Reusable page-level keywords
Playwright-based browser automation
Dynamic test data using Faker
Condition-based waits
Parallel test execution using Pabot
GitHub Actions CI/CD
HTML test reporting
Separation of test cases and reusable implementation

**Run Tests**
Install dependencies:
pip install -r requirements.txt
rfbrowser init
Run tests:
robot tests/
Run tests in parallel:
python -m pabot.pabot --processes 4 --outputdir reports tests/

**CI/CD**
Tests are automatically executed through GitHub Actions using Pabot for parallel execution.

**Purpose**
This project demonstrates practical experience in:
UI test automation
Robot Framework
Playwright-based browser automation
Page Object/resource-based framework design
Test data management
Test synchronization
Parallel test execution
CI/CD automation

**Author**
Preethi Mohanraj
