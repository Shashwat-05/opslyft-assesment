pipeline {
    agent any

    stages{
        stage("cloning") {
            steps{
                git clone 'https://github.com/Shashwat-05/opslyft-assesment.git'
                cd /var/lib/jenkins/workspace/opslyft-assesment/opslyft-assesment
            }

        }
        stage("test") {
            steps {
            echo "testing the flask application ..."
            echo "linting the flask app ..."
            pylint app.py
            echo "testing the flask appl ..."
            pytest app.py
            }
        }
        stage("build"){
            steps {
            echo "building the docker image and pushing on dockerhub ..."
            docker build -t shaswatpp/basic-flask:$BUILD_NUMBER .
            docker push shaswatpp/basic-flask:$BUILD_NUMBER
            }
        }
        stage("deploy"){
            steps{
            echo "deploying the application on k8s cluster ..."
            }
        }
    }
}
