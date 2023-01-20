pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t advanced-network-jenkins:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
		
		
		stage('View Images') {

			steps {
				sh 'docker images'
			}
		}
		
		stage('Docker Tag') {

			steps {
				sh 'docker tag advanced-network-jenkins quancyber/advanced-network-jenkins'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push quancyber/advanced-network-jenkins:advanced-network-jenkins'
			}
		}
		
		stage('Remove current container if it exists') {

			steps {
				sh 'docker rm -f job1 || true'
			}
		}
		
		stage('Run in Container') {

			steps {
				sh 'docker run --publish 3000:3000 --name job1 -d --rm quancyber/advanced-network-jenkins:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
