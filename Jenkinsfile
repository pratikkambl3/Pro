pipeline {  

    agent any
     tools{
        maven "maven-3.9.9"
    } 
    stages {
        stage('Clone') {
            steps {
               git 'https://github.com/ashokitschool/maven-web-app.git'
            }
        }
        stage('Build') {
            steps {
               sh 'mvn clean package'
            }
        }
	stage('Image create'){
	     steps {
	       sh 'docker build -t ashokit/mavenwebapp .'
            }
	}
	stage('Image Push') {
	     steps {
		withCredentials([usernamePassword(credentialsId: 'Docker-Credentials', passwordVariable: 'PWD', usernameVariable: 'USER')]) {
    sh 'docker login -u $(USER) -p $(PWD)'
    sh 'docker push ashokit/mavenwebapp'
}
	    }
	}
	stage('Deploy'){
	     steps {
		sh 'kubectl apply -f k8s-deploy.yml'
	    }
	}
    }
}
