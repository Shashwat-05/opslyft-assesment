pipeline {
    agent any

    stages{
        stage("cloning") {
            steps{
            
                sh 'cd /var/lib/jenkins/workspace/opslyft-assesment_master/opslyft-assesment'
            }

        }
        stage("test") {
            steps {
            echo "testing the flask application ..."
            echo "linting the flask app ..."
            sh 'pylint app.py'
            echo "testing the flask appl ..."
            sh 'pytest app.py'
            }
        }
        stage("build"){
            steps {
            echo "building the docker image and pushing on dockerhub ..."
            sh 'docker build -t shashwatpp/basic-flask:$BUILD_NUMBER .'
            sh 'docker push shashwatpp/basic-flask:$BUILD_NUMBER'
            }
        }
        stage("deploy"){
            steps{
            echo "deploying the application on k8s cluster ..."
            }
        }
    }
}
