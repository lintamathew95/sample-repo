pipeline { 
    environment { 
        registry = "dockeraccountformee/myrepo" 
        registryCredential = 'dockeraccountformee-dockerhub' 
        dockerImage = '' 
    }
    agent any 
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/lintamathew95/sample-repo.git' 
            }
        } 
        stage('Building our image') { 
            steps { 
                script { 
                 dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            } 
      }
        stage('Deploy our image') { 
            steps { 
                script { 

                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                   }

                } 
            }
        } 
        stage('Pull our image') { 
            steps { 
                script { 
                        docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                           dockerImage.pull()
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

