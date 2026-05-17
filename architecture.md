# AWS Architecture

## Overview

This project implements an enterprise AWS Zero Trust Architecture using private networking, HTTPS encryption, centralized logging, threat detection, and containerized workloads.

## Architecture Components

- Amazon VPC
- Public and Private Subnets
- Application Load Balancer
- ECS Fargate
- AWS WAF
- AWS KMS
- CloudWatch
- CloudTrail
- GuardDuty
- Security Hub
- Amazon S3
- DynamoDB

## Security Design

The architecture isolates workloads inside private subnets while AWS WAF protects incoming traffic through the Application Load Balancer.

All sensitive resources are encrypted using AWS KMS and monitored using CloudWatch, CloudTrail, GuardDuty, and Security Hub.

## Architecture Flow

1. User traffic enters through the ALB.
2. AWS WAF filters malicious requests.
3. ECS Fargate hosts the containerized application.
4. CloudWatch and CloudTrail collect logs.
5. GuardDuty and Security Hub monitor threats.
6. AWS KMS encrypts application resources.
