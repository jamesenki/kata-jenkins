def loadValuesYaml(x){
  def valuesYaml = readYaml (file: './pipeline.yml')
  return valuesYaml[x];
}

pipeline {
  environment {
            //credentials
	    dockerHubCredential = loadValuesYaml('dockerHubCredential')
            awsCredential = loadValuesYaml('awsCredential')
	    
	    //docker config
	    imageName = loadValuesYaml('imageName')
	    slackChannel = loadValuesYaml('slackChannel')
	    dockerImage = ''
	    
	    //s3 config
            backendFile = loadValuesYaml('backendFile')
            backendPath = loadValuesYaml('backendPath')
	    
	    //additional external feedback
	    successAction = loadValuesYaml('successAction')
	    failureAction = loadValuesYaml('failureAction')  
	    app_url = ''      
	    
   }
    agent any
    stages {
           // stage('Build Node App') {
             //   steps {
               //     echo 'Building Node app...'
		 //   sh 'npm install-test'
  		 //}
           //}
stage('Build Docker Image') {
             steps {
                script{
                    echo 'Building Docker image...'
                    docker.withRegistry( '', dockerHubCredential ) {
          		          dockerImage = docker.build imageName
		                }
                }
             }
        }	    
	    
       }
    post { 
            success {
               hangoutsNotify message: "Chris Gallivan:::SUCCESS -Kata India",token: "8TAhr5dP97wKtVlaaWya6Hn5l", threadByJob: true    
		
            }
    
            failure {
	  	hangoutsNotify message: "Chris Gallivan:::FAILURE -Kata India",token: "8TAhr5dP97wKtVlaaWya6Hn5l", threadByJob: true
            }
    }
}
