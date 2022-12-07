def COLOR_MAP=[
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]


pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning project codebase'
                git branch: 'main', url: 'https://github.com/R-Diobe/airbnb-infrastructure.git'
                sh 'ls'
            }
        }
        stage('Verify Terraform version') {
            steps {
                echo 'Verifying Terraform version'
                sh 'terraform --version'
            }
        
        }
        
        stage('Terraform init') {
            steps {
                echo 'initializing Terraform project'
                sh 'terraform init'
            }
        
        }
        
        stage('Terraform validate') {
            steps {
                echo 'validating Terraform code'
                sh 'terraform validate'
            }
        
        }
        
        
        stage('Terraform plan') {
            steps {
                echo 'Terraform plan for the dry run'
                sh 'terraform plan'
            }
        
        }
        
        stage('checkov scan') {
            steps {
                echo 'Terraform plan for the dry run'
                sh """
                sudo pip3 install checkov
              
                checkov -d . 
                
                """
            }
        
        }
        
        stage('manual approval') {
            steps {
               
                input 'Approval required for deployment'
            }
        
        }
        
        stage('Terraform apply') {
            steps {
                echo 'Terraform apply to create resource'
                sh 'sudo terraform apply --auto-approve'
            }
        
        }
        
        
    } 
    
    post { 
        always { 
            echo 'I will always say Hello again!'
            slackSend channel: '#devops-project', color: COLOR_MAP[currentBuild.currentResult], message: "Build Started: ${env.JOB_NAME} ${env.BUILD_NUMBER}"
        }
    }
}
