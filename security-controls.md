# Security Controls

## Overview

This document outlines the security controls implemented within the AWS Zero Trust Security Architecture project. The environment uses layered AWS security services to protect workloads, monitor threats, encrypt sensitive data, and provide centralized logging and auditing.

---

# Network Security Controls

## Amazon VPC Segmentation

The environment uses Amazon VPC with separate public and private subnets to isolate application resources and reduce exposure to the public internet.

### Public Subnets

- Application Load Balancer (ALB)
- NAT Gateway

### Private Subnets

- ECS Fargate application workloads
- Internal application communication

---

## Security Groups

Security Groups restrict inbound and outbound traffic using least privilege access principles.

### ALB Security Group

Allowed:

- HTTPS (443)
- HTTP (80)

### ECS Security Group

Allowed:

- Traffic only from the Application Load Balancer

---

# Web Security Controls

## AWS WAF Protection

AWS WAF protects the application from malicious web requests and common web exploits.

### Configured WAF Features

- Rate limiting
- Geographic blocking
- AWS Managed Rules
- CloudWatch logging
- ALB integration

### Blocked Countries

- Russia
- North Korea
- Iran
- Syria
- Cuba
- Venezuela

---

# Encryption Controls

## AWS KMS Encryption

AWS KMS protects sensitive AWS resources using customer-managed encryption keys.

### Encrypted Resources

- Amazon S3
- DynamoDB
- CloudTrail Logs

---

## HTTPS/TLS Encryption

HTTPS encryption secures communication between users and the application.

### Security Features

- AWS Certificate Manager (ACM)
- TLS 1.3 Security Policy
- Secure HTTPS Listener
- HTTP to HTTPS redirection

---

# Identity and Access Management

## IAM Roles

IAM roles provide secure service-to-service communication using least privilege permissions.

### ECS Task Execution Role

Permissions:

- AmazonECSTaskExecutionRolePolicy
- CloudWatchLogsFullAccess

### Application Runtime Role

Permissions:

- AmazonS3ReadOnlyAccess
- AmazonDynamoDBFullAccess

---

# Monitoring and Logging Controls

## Amazon CloudWatch

CloudWatch provides centralized monitoring and operational visibility.

### Monitoring Features

- ECS container logs
- AWS WAF logs
- Application monitoring
- Performance metrics

---

## AWS CloudTrail

CloudTrail records AWS account activity for auditing and security investigations.

### Logging Features

- API activity tracking
- Account activity auditing
- KMS encrypted log storage
- Log validation enabled

---

# Threat Detection Controls

## Amazon GuardDuty

GuardDuty continuously monitors the environment for suspicious activity and threats.

### Threat Detection Features

- Anomalous behavior monitoring
- Unauthorized access detection
- Threat intelligence analysis

---

## AWS Security Hub

Security Hub centralizes and aggregates security findings across AWS services.

### Security Monitoring Features

- Vulnerability findings
- Security posture management
- Centralized security dashboard
- Compliance visibility

---

# Container Security Controls

## Amazon ECR Vulnerability Scanning

Amazon ECR scans container images for known vulnerabilities.

### Security Features

- Scan on push enabled
- Vulnerability reporting
- Container image remediation workflow

---

## ECS Fargate Security

ECS Fargate provides serverless container security and workload isolation.

### Security Benefits

- No server management required
- Isolated runtime environment
- AWS-managed infrastructure security

---

# Security Validation

## AWS WAF Block Logs

AWS WAF successfully blocked suspicious web traffic and logged the security events in CloudWatch Logs.

## Security Hub Findings

Security Hub identified container vulnerabilities including:

- CVE-2026-33845
- CVE-2026-42010

## Vulnerability Remediation

The Docker container was rebuilt using a secure and updated base image to remediate detected vulnerabilities.

---

# Zero Trust Security Principles

This project follows Zero Trust security principles by implementing:

- Least privilege access
- Network segmentation
- Continuous monitoring
- Threat detection
- Encryption by default
- Secure application access
- Centralized logging and auditing

---

# Final Summary

This project demonstrates enterprise AWS security best practices using layered security controls, monitoring services, encryption, threat detection, vulnerability management, and secure cloud infrastructure deployment.

---
