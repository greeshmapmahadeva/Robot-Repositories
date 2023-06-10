pipeline {
  agent any
  environment {
    QA_SERVER = 'https://www.google.com/'
    

  }
  stages {
      
        
        stage('Checkout') {
            steps {
                script{
                    

                    git branch: "master", url:'https://github.com/Manik1495/Robot-Repositories.git'
                      }
                
                  }
           }
	    
    
	    stage('Execute script') {
            	steps {
                	sh 'robot *.robot'
            	}
       	      }
  }
	    post {
        	always {
		        script {
		          step(
			            [
			              $class              : 'RobotPublisher',
			              outputPath          : 'reports',
			              outputFileName      : '**/output.xml',
			              reportFileName      : '**/report.html',
			              logFileName         : '**/log.html',
			              disableArchiveOutput: false,
			              passThreshold       : 50,
			              unstableThreshold   : 40,
			              otherFiles          : "**/*.png,**/*.jpg",
			            ]
		          	)
		        }
	  		}		
	    }
	}    
  
  
