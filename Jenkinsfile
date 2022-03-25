pipeline { 
    environment { 
        registry = "dockeraccountformee/myrepo" 
        registryCredential = 'dockeraccountformee-dockerhub' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Clone the repo') { 
            steps { 
                git 'https://github.com/lintamathew95/sample-repo.git' 
            }
        } 
        stage('Building the docker image') { 
            steps { 
                script { 
                 dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            } 
      }
        stage('Deploy the image') { 
            steps { 
                script { 

                //    docker.withRegistry( '', registryCredential ) { 
                //        dockerImage.push() 
                //   }

                } 
            }
        } 
        stage('Pull the image') { 
            steps { 
                script { 
                      //  docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                       //    dockerImage.pull()
                      //  }
                     }
                } 
            }
         stage('Run as images container') { 
            steps { 
                script { 
                  //  docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                      //      dockerImage.run()
                           
                        }
                     }
                } 
            }
              
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        }
    }
}

