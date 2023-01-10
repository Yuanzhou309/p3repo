pipeline {
    agent any
	
	parameters {

		booleanParam defaultValue: true, description: 'true to build img', name: 'BuildImg'
		booleanParam defaultValue: true, description: 'true to run img', name: 'RunImg'
		booleanParam defaultValue: true, description: 'true to uploadimg', name: 'UploadImg'
		
		
		string defaultValue: '1.0', name: 'ImgTag', trim: true
		}
	
	environment {
	 	ImgName = "applesama/p3project"
	  	ImgTag = "${params.ImgTag}"
			}

	
	
    stages {
	    
        stage('Build Docker Image') {
	      when {
		     expression {return params.BuildImg}
	     }
            steps {

                echo 'Building docker image'	
                sh 'sudo docker build -t $ImgName:$ImgTag .'
		
            }
        }
	    
	    
	    
     stage('Run Docker Image') {
	     when {
		     expression {return params.RunImg}
	     }
            steps {
                echo 'Runing docker image'
                 sh 'sudo docker run --rm -d -p 80:80 --name nodejs $ImgName:$ImgTag'
		
            }
	 }
    

     stage('Upload Docker Image') {

	     when {
		     expression {return params.UploadImg}
	     }
	     
	     
	    steps {
                withCredentials([usernamePassword(credentialsId: 'applesama_dockerhub', passwordVariable: 'dockerPwd', usernameVariable: 'dockerUsr')]) {
                    
		    echo 'Dockerhub Login'
                    sh 'sudo docker login -u $dockerUsr -p $dockerPwd'
		    sh 'sudo docker push $ImgName:$ImgTag'
                }
            }

	} 
	
    }

	
	
	
	
	
	
	
	
post {
  always {
   sh'docker stop nodejs'
   sh 'sudo docker rm -vf $(sudo docker ps -aq) &>/dev/null'
  }
}
	

	
}
