pipeline {
environment {
registry = "dockerforlinta/myrepo"
registryCredential = 'dockerforlinta'
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
steps{
script {
dockerImage = docker.build imagename
// dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
     dockerImage.push("$BUILD_NUMBER")
     dockerImage.push('latest')

 }
}
}
}
stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
}
}
