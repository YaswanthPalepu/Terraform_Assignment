pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
  }

  stages {
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -var-file="terraform.tfvars.json"'
      }
    }
    stage('Terraform Apply') {
      steps {
        sh 'terraform apply -auto-approve -var-file="terraform.tfvars.json"'
      }
    }
  }
}
