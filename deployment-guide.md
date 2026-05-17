# Deployment Guide

## Overview

This guide walks through the deployment of an Enterprise AWS Zero Trust Security Architecture using Amazon ECS Fargate, Application Load Balancer, AWS WAF, AWS KMS, GuardDuty, Security Hub, CloudTrail, Amazon S3, and DynamoDB.

---

# Step 1: Create the AWS Network Infrastructure

## Create the VPC

- Create VPC: `enterprise-zero-trust-vpc`
- CIDR Block: `10.0.0.0/16`

## Create Public Subnets

- `public-alb-subnet-az1`
- `public-alb-subnet-az2`

## Create Private Application Subnets

- `private-app-subnet-az1`
- `private-app-subnet-az2`

## Create Private Security Subnets

- `private-security-subnet-az1`
- `private-security-subnet-az2`

## Configure Internet Gateway

- Create Internet Gateway
- Attach Internet Gateway to VPC

## Configure NAT Gateway

- Create NAT Gateway
- Configure private route table access

---

# Step 2: Configure IAM and Security

## Create ECS Task Execution Role

Role Name:

```text
ECS-TaskExecutionRole
```

Permissions:

- AmazonECSTaskExecutionRolePolicy
- CloudWatchLogsFullAccess

## Create Application Runtime Role

Role Name:

```text
AppRuntimeRole
```

Permissions:

- AmazonS3ReadOnlyAccess
- AmazonDynamoDBFullAccess

---

# Step 3: Configure AWS KMS Encryption

## Create KMS Key

Key Alias:

```text
enterprise-kms-key
```

Purpose:

- Encrypt S3 buckets
- Encrypt DynamoDB
- Encrypt CloudTrail logs

---

# Step 4: Create Storage Services

## Create Amazon S3 Bucket

Bucket Name:

```text
enterprise-zero-trust-storage-jbanday
```

Security Features:

- Block Public Access
- Enable Versioning
- Enable SSE-KMS Encryption

## Create DynamoDB Table

Table Name:

```text
enterprise-app-table
```

Partition Key:

```text
AppID
```

Security Features:

- Customer Managed KMS Key
- Deletion Protection Enabled

---

# Step 5: Configure Amazon ECR

## Create ECR Repository

Repository Name:

```text
enterprise-zero-trust-app
```

Features:

- Scan on Push Enabled
- AES-256 Encryption

---

# Step 6: Build the Docker Application

## Create index.html

```html
<h1>Enterprise Zero Trust App is Running</h1>
```

## Create Dockerfile

```dockerfile
FROM nginx:stable-alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
```

---

# Step 7: Build and Push Docker Image

## Build Docker Image

Command Overview:

Command: `docker build --no-cache -t enterprise-zero-trust-app .`

Explanation:

- `docker build`: Builds Docker image.
- `--no-cache`: Rebuilds image without cache.
- `-t`: Adds image tag.

Summary: Builds the secure Alpine-based Docker container.

---

## Tag Docker Image

Command Overview:

Command: `docker tag enterprise-zero-trust-app:latest 727646499790.dkr.ecr.us-east-1.amazonaws.com/enterprise-zero-trust-app:latest`

Explanation:

- `docker tag`: Tags Docker image.
- `latest`: Current image version.
- `727646499790.dkr.ecr.us-east-1.amazonaws.com`: Amazon ECR repository.

Summary: Tags the Docker image for Amazon ECR.

---

## Push Docker Image

Command Overview:

Command: `docker push 727646499790.dkr.ecr.us-east-1.amazonaws.com/enterprise-zero-trust-app:latest`

Explanation:

- `docker push`: Uploads image to ECR.
- `latest`: Pushes latest image version.

Summary: Publishes the container image to Amazon ECR.

---

# Step 8: Deploy Amazon ECS Fargate

## Create ECS Cluster

Cluster Name:

```text
enterprise-security-cluster
```

Configuration:

- Fargate Only
- Container Insights Enabled

## Create ECS Task Definition

Task Definition:

```text
enterprise-zero-trust-task
```

Container:

```text
enterprise-zero-trust-container
```

Configuration:

- CPU: `.25 vCPU`
- Memory: `.5 GB`
- Port: `80`
- CloudWatch Logging Enabled

## Deploy ECS Service

Service Name:

```text
enterprise-zero-trust-task-service
```

Features:

- Application Load Balancer
- Private Subnets
- Rolling Updates
- ECS Deployment Circuit Breaker

---

# Step 9: Configure Application Load Balancer

## Configure ALB

Load Balancer:

```text
enterprise-alb
```

Features:

- Public Subnets
- HTTP Listener
- HTTPS Listener
- Target Group Health Checks

---

# Step 10: Configure HTTPS and Route 53

## Request ACM Certificate

Domain:

```text
caremedix.net
```

Validation:

- DNS Validation

## Configure Route 53

- Create Hosted Zone
- Add ACM Validation CNAME
- Configure DNS Record to ALB

## Configure HTTPS Listener

Features:

- TLS 1.3 Security Policy
- ACM SSL Certificate
- HTTP to HTTPS Redirect

---

# Step 11: Enable AWS Security Services

## Enable AWS GuardDuty

Purpose:

- Threat detection
- Suspicious activity monitoring

## Enable AWS Security Hub

Purpose:

- Centralized security monitoring
- Security findings aggregation

## Enable AWS CloudTrail

Trail Name:

```text
enterprise-cloudtrail
```

Features:

- Management Event Logging
- SSE-KMS Encryption
- Log File Validation

---

# Step 12: Configure AWS WAF

## Create AWS WAF Web ACL

WAF Name:

```text
enterprise-waf
```

Features:

- Rate Limiting
- Geographic Blocking
- CloudWatch Logging
- ALB Protection

Blocked Countries:

- Russia
- North Korea
- Iran
- Syria
- Cuba
- Venezuela

---

# Step 13: Verify Security Monitoring

## Verify WAF Logs

CloudWatch Log Group:

```text
aws-waf-logs-enterprise
```

## Verify Security Hub Findings

Test Findings:

- CVE-2026-33845
- CVE-2026-42010

---

# Step 14: Remediate Vulnerabilities

## Update Dockerfile

```dockerfile
FROM nginx:stable-alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
```

## Rebuild and Push Updated Container

- Rebuild Docker image
- Push updated image to ECR
- Force ECS deployment refresh

---

# Architecture Summary

This project demonstrates a production-style AWS Zero Trust Security Architecture using secure networking, container security, encryption, centralized monitoring, HTTPS protection, and threat detection services across AWS.

---
