# Assignment Execution Guide

## 1. Project files created

The following files are ready in this repository:
- [app.py](app.py)
- [requirements.txt](requirements.txt)
- [tests/test_app.py](tests/test_app.py)
- [Jenkinsfile](Jenkinsfile)
- [.github/workflows/ci-cd.yml](.github/workflows/ci-cd.yml)
- [scripts/deploy.sh](scripts/deploy.sh)
- [README.md](README.md)

## 2. Push to GitHub

1. Create a new GitHub repository, for example:
   https://github.com/pramod704/flask-ci-cd-assignment
2. Run these commands in the project folder:

```bash
git branch -M main
git remote add origin https://github.com/pramod704/flask-ci-cd-assignment.git
git add .
git commit -m "Initial CI/CD setup"
git push -u origin main
```

3. Create a second branch named staging and push it:

```bash
git checkout -b staging
git push -u origin staging
```

## 3. Jenkins setup

1. Install Jenkins on a VM or cloud server.
2. Install Java, Python 3, and these plugins:
   - GitHub Integration
   - Pipeline
   - Email Extension
3. Create a new Pipeline job.
4. Point it to your GitHub repository.
5. Use [Jenkinsfile](Jenkinsfile) as the pipeline definition.
6. Set the branch to main.
7. Replace the email address in [Jenkinsfile](Jenkinsfile) with your actual email.
8. Run the pipeline.

### Jenkins screenshots to capture
- Jenkins job configuration page
- Build console output showing Build, Test, and Deploy stages
- Blue Ocean or stage view showing successful execution

## 4. GitHub Actions setup

1. Open the repository on GitHub.
2. Go to Settings > Secrets and variables > Actions.
3. Add any deployment secrets if you later connect to a real deployment target.
4. Push to main or staging to trigger the workflow.
5. Open the Actions tab and view the workflow run.

### GitHub Actions screenshots to capture
- Workflow run list
- Successful run showing Test, Deploy to staging, and Deploy to production steps
- Any relevant logs for the install and test steps

## 5. Submission notes

Submit:
- GitHub repository URL
- Screenshots of Jenkins pipeline execution
- Screenshots of GitHub Actions workflow execution
- Brief explanation that the pipeline performs build, test, and deployment
