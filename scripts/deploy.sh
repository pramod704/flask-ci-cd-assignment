#!/usr/bin/env bash
set -euo pipefail

echo "Deploying Flask app to staging environment..."
mkdir -p staging
cp app.py requirements.txt staging/
echo "Deployment completed successfully."
echo "Target: ${DEPLOY_TARGET:-staging}"
