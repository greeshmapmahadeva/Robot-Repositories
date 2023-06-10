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
	    stage('Install dependencies') {
            steps {
                sh '/usr/bin/python3 -m pip install --upgrade pip'
                sh '/usr/bin/python3 -m pip install -r requirements.txt'
            }
        }
    
	    stage('Execute script') {
            	steps {
                	sh 'python -m robot tests/ '
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
  
  
