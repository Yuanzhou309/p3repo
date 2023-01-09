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
		
	
                sh 'sudo docker run -p 80:80 --name userprofile applesama/p3project1.0 .'
		
            }
	 }
     stage('test npm') {
            steps {
                echo 'test see if npm can start'
		
		sh ''
              
		
            }
	 }
	    
	    
	    













    }
}
