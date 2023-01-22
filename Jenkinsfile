pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {
	    
		stage('Build') {

			steps {
				sh 'docker build -t  quancyber/jenkins-docker:latest .'
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

		stage('Push') {

			steps {
				sh 'docker push quancyber/jenkins-docker:latest'
			}
		}

    	stage('Run in Container') {

			steps {
				sh 'docker run --publish 3000:3000 --name testNodeJS -d --rm quancyber/jenkins-docker:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
