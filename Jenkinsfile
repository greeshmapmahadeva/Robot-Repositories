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
	    
    
	    stage('Run Robot Tests') {
	      steps {
		      //  	sh 'python3 -m rflint --ignore LineTooLong myapp'
		      //  	sh 'python3 -m robot.run --NoStatusRC --variable SERVER:${CT_SERVER} --outputdir reports1 myapp/uiTest/testCases/smokeSuite/'
		      //  	sh 'python3 -m robot.run --NoStatusRC --variable SERVER:${CT_SERVER} --rerunfailed reports1/output.xml --outputdir reports myapp/uiTest/testCases/smokeSuite/'
		      //  	sh 'python3 -m robot.rebot --merge --output reports/output.xml -l reports/log.html -r reports/report.html reports1/output.xml reports/output.xml'
		      //  	sh 'exit 0'
		   script{
			    pwd
		            sh 'cd Robot_Repositories'
		            sh 'PATH=/Library/Frameworks/Python.framework/Versions/3.11/bin:$PATH'
                    	sh 'cd Robot_Repositories'
                    sh 'echo PATH'
                    sh 'python3 -m robot --outputdir reports tests/*.robot'
                    
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
  }
  
}
