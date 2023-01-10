pipeline {
    agent any
	
	parameters {
  		booleanParam defaultValue: true, description: 'true to uploadimg', name: 'Uploadimg'
		}
	
	enviroment {
		ImgName="applesama/p3project1.0"
		ImgTag="${params.ImgTag}"
	}
	
	
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
                 sh 'sudo docker run --rm -d -p 80:80 --name nodejs applesama/p3project1.0'
		
            }
	 }
    }

	
	
	
	
	
	
	
	
post {
  always {
   sh'docker stop nodejs'
  }
}

	
	
}
