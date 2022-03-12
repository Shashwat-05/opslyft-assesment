pipeline {
    agent any

    stages{
        stage("cloning") {
            steps{
                sh 'git clone https://github.com/Shashwat-05/opslyft-assesment.git'
                sh 'cd /var/lib/jenkins/workspace/opslyft-assesment_master/'
            }

        }
        stage("test") {
            steps {
            echo "testing the flask application ..."
            echo "linting the flask app ..."
            sh 'pylint app.py'
            // echo "testing the flask appl ..."
            // sh 'pytest app.py'
            }
        }
        stage("build and push"){
            steps{

            docker.withRegistry('https://index.docker.io/v1/', 'dockerid') {

            def customImage = docker.build("shashwatpp/basic-flask:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
            customImage.push()
            }
            // steps {
            // echo "building the docker image and pushing on dockerhub ..."

            // // sh 'docker build -t shashwatpp/basic-flask:$BUILD_NUMBER .'
            // // sh 'docker push shashwatpp/basic-flask:$BUILD_NUMBER'
            // }
        }
        stage("deploy"){
            steps{
            echo "deploying the application on k8s cluster ..."
            }
        }
    }
}}
