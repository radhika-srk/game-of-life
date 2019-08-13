pipeline {
    agent any 
    environment {
        AWS_ROLE = "Terraformrole"
    }
    parameters {
        choice(name: 'env', choices: 'DEV\nTEST', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }
    stages {
        stage('git') {
            steps {
                git 'https://github.com/veerendradevops/game-of-life.git'
            }
        }
        stage('build') {
            steps {
                sh '/opt/maven/bin/mvn clean package'
            }
        }
        stage('IAC') {
            environment {
                LAYER = "${params.env}"
                INFRA_ACTION = "${params.action}"
            }
            steps {
               script {
                    
                if (params.env == 'DEV')
                sh "make $INFRA_ACTION"
               }
            }
        }
    }
}