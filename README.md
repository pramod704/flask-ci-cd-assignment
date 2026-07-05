EC2 Instance

 

Jav installs
 

Commands for Jenkins
sudo apt update -y
sudo apt install -y openjdk-11-jdk git curl gnupg2 software-properties-common’

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
  sudo gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] \
https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y
sudo apt install -y Jenkins

 

Jenkins user key
  

 

Adding student record  
 
 












Updating student record

 

Deleted sumit age 23 
 

Jenkins file
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

App.py
from flask import Flask, redirect, render_template, request, url_for

app = Flask(__name__)

students = []
next_id = 1

@app.route("/", methods=["GET", "POST"])
def home():
    global next_id

    if request.method == "POST":
        student_id = request.form.get("student_id", type=int)
        name = request.form.get("name", "").strip()
        course = request.form.get("course", "").strip()

        if not name or not course:
            return redirect(url_for("home"))

        if student_id is None:
            students.append({"id": next_id, "name": name, "course": course})
            next_id += 1
        else:
            for student in students:
                if student["id"] == student_id:
                    student["name"] = name
                    student["course"] = course
                    break

        return redirect(url_for("home"))

    return render_template("index.html", students=students)

@app.route("/edit/<int:student_id>")
def edit_student(student_id):
    student = next((s for s in students if s["id"] == student_id), None)
    if student is None:
        return redirect(url_for("home"))

    return render_template(
        "index.html",
        students=students,
        student_id=student["id"],
        name=student["name"],
        course=student["course"],
    )

@app.route("/delete/<int:student_id>")
def delete_student(student_id):
    global students
    students = [s for s in students if s["id"] != student_id]
    return redirect(url_for("home"))

@app.route("/health")
def health():
    return {"status": "ok"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

http://127.0.0.1:5000/


