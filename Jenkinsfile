def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]
def loadValuesYaml(x){
  def valuesYaml = readYaml (file: './pipeline.yml')
  return valuesYaml[x];
}

pipeline {
  environment {
        
	    
   }
    agent any
    stages {
        stage('Build Node App') {
            steps {
                echo 'Building Node app...'
                  }
        }
        stage('Build Docker Image') {
             steps {
                script{
                    echo 'Building Docker image...'
                
                }
             }
        }
        stage('Deploy to Docker Hub') {
            steps {
               script {
                    echo 'Publishing Image to Docker Hub...'
                
                    }
                }
             }
        }
        stage('Cleanup Local Image') {
            steps {
               script {
                    }
         }
       }
      }
   
    }
    post { 
        success {
      hangoutsNotify message: "Chris Gallivan:::SUCCESS",token: "8TAhr5dP97wKtVlaaWya6Hn5l", threadByJob: true    
		
        }
    
        failure {
	  	hangoutsNotify message: "Chris Gallivan:::FAILURE",token: "8TAhr5dP97wKtVlaaWya6Hn5l", threadByJob: true
        }
    }
}
