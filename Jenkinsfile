pipeline {
    agent any
	
	parameters {

		booleanParam defaultValue: true, description: 'true to build img', name: 'BuildImg'
		booleanParam defaultValue: true, description: 'true to run img', name: 'RunImg'
		booleanParam defaultValue: true, description: 'true to uploadimg', name: 'UploadImg'
		booleanParam defaultValue: true, description: 'true to uploadimg', name: 'Uploadtos3'
		
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
                sh 'docker build -t $ImgName:$ImgTag .'
		
            }
        }
	    
	    
	    
     stage('Run Docker Image') {
	     when {
		     expression {return params.RunImg}
	     }
            steps {
                echo 'Runing docker image'
                 sh 'docker run --rm -d -p 80:80 --name nodejs $ImgName:$ImgTag'
		
            }
	 }
    

     stage('Upload Docker Image') {

	     when {
		     expression {return params.UploadImg}
	     }
	     
	     
	    steps {
                withCredentials([usernamePassword(credentialsId: 'applesama_dockerhub', passwordVariable: 'dockerPwd', usernameVariable: 'dockerUsr')]) {
                    
		    echo 'Dockerhub Login'
                    sh 'docker login -u $dockerUsr -p $dockerPwd'
		    sh 'docker push $ImgName:$ImgTag'
                }
            }

	} 
         stage('Upload to AWS') {
	      
	   when {
		 expression {return params.Uploadtos3}
	        }
	      
              steps {
		sh'pwd'
		sh'cd ..'
		sh'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
		sh'unzip awscliv2.zip'
	 	sh'./aws/install -i /usr/local/aws-cli -b /usr/local/bin'
		sh'cd -'
		sh 'aws s3 sync . s3://mysamplebucket309'
                  }
              }
       
	
	    
	    
	    
	    
	    
	    
	    
	    
    }

	
	
	
	
	
	
	

	

	
}
