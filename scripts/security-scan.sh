#!/bin/bash

aws ecr describe-image-scan-findings \
--repository-name enterprise-zero-trust-app \
--region us-east-1