pipeline {
    agent any 

    stages{

     stage ("Cloning github repo") {

        steps {
            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Abheek246/Infrastructure-Project.git']])
        }

    }
    stage (" Terraform Init"){
        steps{
        sh ("terraform init -reconfigure")
        }
    }
    stage("Terraform Plan") {
        steps{

        sh("terraform plan")
        }
    }
    stage ("Terraform Action") {
        steps{
        sh ("terraform ${action} --auto-approve")
        }
    }
    }
}
