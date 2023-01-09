pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building docker image'	
                sh 'sudo docker build -t p3project2.0 .'
		
            }
        }
     stage('Run Docker Image') {
            steps {
                echo 'Runing docker image'
                sh 'sudo docker run -d -p 80:80 --name p3 p3project2.0 .'
		
            }
	 }
      















	

    }
}
