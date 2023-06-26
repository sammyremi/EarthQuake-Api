# Welcome to My Api
The Earthquake API is a RESTful API that provides information about earthquakes. It utilizes Redis for caching, Swagger for API documentation, Google OAuth2 for authentication, and is deployed on AWS EC2 within Docker containers.

# API URL
my_api app aws url: https://my-earthquake-api-v1.fly.dev

swagger documentation url: https://my-earthquake-api-v1.fly.dev/api-docs/index.html

## Task
Fetch earthquake data from the Quakes API and provide a consistent and standardized interface for accessing earthquake information.

Cache earthquake data using Redis to improve performance and reduce the load on the Quakes API.

Secure endpoints using Google OAuth2 authentication to ensure only authorized users can access protected resources.

Comprehensive API documentation with Swagger to assist developers in understanding and utilizing the available endpoints.

Deployment on AWS EC2 within Docker containers for easy scalability and portability.

## Description
To access protected endpoints, users must authenticate using their Google accounts through the Google OAuth2 authentication process. The API verifies the user's identity and grants access to protected resources accordingly.

## Installation
Ruby version 3.2.2
Rails version 7.X.X
Redis
Docker
AWS EC2 instance

## Usage
https://my-earthquake-api-v1.fly.dev

git clone repo

bundle install

rails db:migrate

rails db:seed

rails server
```
./my_project argument1 argument2
```

### The Core Team

Samuel Adebayo

<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px'></span>
