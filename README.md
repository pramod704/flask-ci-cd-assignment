# Flask CI/CD Assignment

This repository contains a simple Flask application with:
- a Jenkins pipeline
- a GitHub Actions workflow
- unit tests
- deployment scripts for staging/production

## Prerequisites

- Python 3.10+
- pip
- Jenkins installed and configured
- GitHub repository with branch protection enabled if needed

## Local Setup

```bash
python -m venv .venv
source .venv/bin/activate  # On Windows use .venv\Scripts\activate
pip install -r requirements.txt
pytest -q
```

## Jenkins Setup

1. Install Jenkins on a VM or cloud server.
2. Install Python, pip, and the following plugins:
   - GitHub Integration
   - Pipeline
   - Email Extension
3. Create a new Pipeline job.
4. Point it to this repository.
5. Use the included Jenkinsfile.
6. Configure GitHub hook or polling for the main branch.
7. Replace the email address in Jenkinsfile with your email.

## GitHub Actions Setup

1. Push this repository to GitHub.
2. Create branches `main` and `staging`.
3. Add secrets if you later connect to a real deployment target.
4. The workflow will run on pushes to `main` and `staging` and on version tags starting with `v`.

## Deployment

The deployment step runs the script in [scripts/deploy.sh](scripts/deploy.sh).

## Assignment Submission

Submit the GitHub repository URL along with screenshots of the Jenkins and GitHub Actions runs.
