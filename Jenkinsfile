pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/quancyber/jenkins-docker.git'
			}
		}

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

		stage('Push') {

			steps {
				sh 'docker push quancyber/jenkins-docker:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
