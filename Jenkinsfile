pipeline {
    agent any

    stages {
        stage ('Git Pull Stage') {
            steps {
                    git branch: 'main', credentialsId: '68762c80-8964-41c1-8cf1-fc88d6087436', url: 'https://github.com/sridharkondeti/PythonWebApps'
            }
        }
        
        stage('Clean Up') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'docker container kill $(docker ps -q)'
                }
            }
        }

        stage ('Build Stage') {
            steps {
                sh 'docker build -t python-hw .'
            }
        }
        stage ('Deployment Stage') {
            steps {
                    sh 'docker run -d -p 5000:5000 python-hw'
            }
        }
    }
}
