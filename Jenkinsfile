pipeline {
    agent any
	
	parameters {
  		booleanParam defaultValue: true, description: 'true to uploadimg', name: 'Uploadimg'
		}
	
	
	
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
                sh 'docker run --rm -d -p 80:80 --name react-app my-app'
		
            }
	 }
      







	cleanWs()

    
	post {
  		failure {
			steps {
           
		
            }
			
   		 // One or more steps need to be included within each condition's block.
 	 	}
	} 
	    
	post {
  		always {
   		 	steps {
           
		
            }
			
			// One or more steps need to be included within each condition's block.
 	 	}
	}




	

    }
}
