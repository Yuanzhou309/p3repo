pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building docker image'	
                sh 'sudo docker build -t my-app .'
		
            }
        }
     stage('Run Docker Image') {
            steps {
                echo 'Runing docker image'
                sh 'docker run --rm -u root -p 80:80 --name react-app my-app .'
		
            }
	 }
      














	

    }
}
