pipeline {
    agent any 
    environment {
        AWS_ROLE = "Terraformrole"
    }
    parameters {
        choice(name: 'env', choices: 'DEV_PRACTICE\nTEST_PRACTICE', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }
    stages {
        stage ('git') {
            steps {
                https://github.com/veerendradevops/game-of-life.git
            }
        }
        stage('build') {
            steps {
                sh '/opt/maven/mvn clean package'
            }
        }
    } 



}