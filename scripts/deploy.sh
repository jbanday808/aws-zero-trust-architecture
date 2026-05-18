#!/bin/bash

aws ecs update-service \
--cluster enterprise-security-cluster \
--service enterprise-zero-trust-task-service \
--force-new-deployment \
--region us-east-1