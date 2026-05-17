# AWS Zero Trust Architecture

## Overview

This project demonstrates an enterprise AWS Zero Trust Architecture using ECS Fargate, Application Load Balancer, AWS WAF, AWS KMS, GuardDuty, Security Hub, and CloudTrail.

The architecture follows Zero Trust security principles by implementing private networking, encryption, threat detection, centralized logging, HTTPS protection, and container security within AWS.

---

## Architecture Diagram

![AWS Zero Trust Architecture](images/Zero_trust.png)

---

## Secure Application Website

![Secure Website](images/Secure_Website.png)

---

## AWS Services

- Amazon VPC
- ECS Fargate
- Amazon ECR
- Application Load Balancer (ALB)
- AWS WAF
- AWS KMS
- Amazon CloudWatch
- AWS CloudTrail
- Amazon GuardDuty
- AWS Security Hub
- Amazon S3
- Amazon DynamoDB
- AWS Certificate Manager (ACM)
- Route 53

---

## Security Features

- Private application subnets
- HTTPS/TLS encryption
- AWS WAF web protection
- Threat detection with GuardDuty
- Centralized monitoring with Security Hub
- CloudTrail auditing and logging
- AWS KMS encryption
- Containerized workloads with ECS Fargate
- ECR image vulnerability scanning

---

## Security Validation Screenshots

### AWS WAF Block Logs

![AWS WAF Logs](images/AWS%20WAF%20BLOCK%20Logs.png)

### Security Hub Finding — CVE-2026-33845

![CVE-2026-33845](images/CVE-2026-33845.png)

### Security Hub Finding — CVE-2026-42010

![CVE-2026-42010](images/CVE-2026-42010.png)

### Remediation Success

![Remediation Success](images/Remediation%20Success.png)

---

## Architecture Flow

1. User traffic enters through the Application Load Balancer.
2. AWS WAF filters malicious requests.
3. HTTPS traffic is secured using AWS Certificate Manager.
4. ECS Fargate runs containers inside private subnets.
5. Amazon S3 securely stores application content.
6. DynamoDB stores application data.
7. CloudWatch and CloudTrail monitor activity and logging.
8. GuardDuty and Security Hub provide threat detection and security findings.
9. AWS KMS encrypts sensitive resources and logs.

---

## Repository Structure

```text
src/
images/
docs/
scripts/
README.md
architecture.md
deployment-guide.md
security-controls.md
lessons-learned.md
```

---

## Deployment

See:

- deployment-guide.md
- architecture.md
- security-controls.md

---

## Lessons Learned

- Built an enterprise-style AWS Zero Trust Architecture
- Secured workloads using private networking
- Configured HTTPS with ACM
- Implemented AWS WAF protection
- Monitored threats using GuardDuty and Security Hub
- Improved Docker container security
- Used AWS logging and monitoring services for auditing and visibility

---

## Author

James Banday

GitHub: https://github.com/jbanday808

LinkedIn: https://www.linkedin.com/in/james-allen-morta-banday-62a391128/
