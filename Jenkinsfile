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
     stage('test npm') {
            steps {
                echo 'test see if npm can start'
              
		
            }
	 }
	    
	    
	    
      stage('Upload Docker Image') {
	    steps {
                withCredentials([usernamePassword(credentialsId: 'applesama_dockerhub', passwordVariable: 'dockerPwd', usernameVariable: 'dockerUsr')]) {
                    // some block
		    echo 'Dockerhub Login'
                    sh 'sudo docker login -u $dockerUsr -p $dockerPwd'
		    sh 'sudo docker push applesama/p3project1.0'
                }
            }














	} 

    }
}
