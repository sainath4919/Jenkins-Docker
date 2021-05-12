node{
    stage("Git CheckOut"){
        git url: 'https://github.com/thippeswamy242/Jenkins-Docker.git',branch: 'main'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
      } 
       stage("Build Dokcer Image") {
         sh "docker build -t thippeswamy/webapp-demo:${BUILD_NUMBER} ."
       }
        stage("Docker Push"){
        withCredentials([string(credentialsId: 'Docker_Hub_Pwd', variable: 'Docker_Hub_Pwd')]) {
          sh "docker login -u thippeswamy -p ${Docker_Hub_Pwd}"
        }
        sh "docker push thippeswamy/webapp-demo:${BUILD_NUMBER}"
        
    }
    
    // Remove local image in Jenkins Server
    stage("Remove Local Image"){
        sh "docker rmi -f thippeswamy/webapp-demo:${BUILD_NUMBER}"
    }
    
     stage("Deploy to docker cluster"){
        sshagent(['Docker_Machine']) {
		    sh "ssh -o StrictHostKeyChecking=no root@172.31.43.211 docker stop webapp"
			sh "ssh -o StrictHostKeyChecking=no root@172.31.43.211 docker system prune -af"
			sh "ssh -o StrictHostKeyChecking=no root@172.31.43.211 docker run -itd -p 8080:8080 --name webapp thippeswamy/webapp-demo:${BUILD_NUMBER}"
        }
    }

    }
    
