pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building docker image'	
                sh 'sudo docker build -t applesama/p3project1.0 .'
		
            }
        }
     stage('Run Docker Image') {
            steps {
                echo 'Runing docker image'
                sh 'sudo docker run -d -p 80:80 --name userprofile applesama/p3project1.0 .'
		
            }
	 }
      















	

    }
}
