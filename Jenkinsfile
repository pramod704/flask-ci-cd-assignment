pipeline {
    agent any

    environment {
        PYTHONUNBUFFERED = '1'
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Build') {
            steps {
                sh 'python3 -m pip install --upgrade pip'
                sh 'python3 -m pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                sh 'python3 -m pytest -q'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                sh 'chmod +x scripts/deploy.sh && ./scripts/deploy.sh'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            mail to: 'your-email@example.com',
                 subject: "Jenkins Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: 'The Jenkins pipeline failed. Please check the console output.'
        }
    }
}
