pipeline {
  agent none
  stages {
    stage ('Build') {
      agent { label 'build' }
      steps {
        sh "echo ${BUILD_VERSION}"
        sh 'mvn deploy'
        sh 'pwd'
      }
    }
    stage ('Deploy') {
      agent { label 'deploy' }
      steps {
        sh 'pwd'
        sh 'whoami'
        sh 'curl -u wali.uddin9@gmail.com:Wali@8792 -O https://syedwaliuddin.jfrog.io/artifactory/libs-release-local/com/efsavage/hello-world-war/${BUILD_VERSION}/hello-world-war-${BUILD_VERSION}.war'
        sh 'sudo cp -r workspace/pipelinejob/target/hello-world-war-${BUILD_VERSION}.war /opt/tomcat/webapps/'
        sh 'sudo sh /opt/tomcat/bin/shutdown.sh'
        sh 'sleep 3'
        sh 'sudo sh /opt/tomcat/bin/startup.sh'
      }
    }
  }
}
