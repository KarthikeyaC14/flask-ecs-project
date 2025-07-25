pipeline {
    agent any

    environment {
        // Define AWS region and ECR repo name
        AWS_REGION = 'us-east-1'
        ECR_REPO_NAME = 'flask-app-repo'
        // Retrieve AWS credentials from Jenkins Credentials Manager
        AWS_CREDENTIALS = credentials('your-jenkins-aws-credentials-id')
    }

    triggers {
        // This is a simplified trigger. A real-world scenario would use a
        // webhook from ECR via SNS and SQS to trigger Jenkins.
        // For now, we can trigger this manually or on a schedule.
        pollSCM('') // Or use a webhook trigger plugin
    }

    stages {
        stage('Checkout SCM') {
            steps {
                // Get the code from GitHub
                git branch: 'main', url: 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Terraform Deploy to ECS') {
            steps {
                script {
                    // Use the AWS credentials
                    withCredentials([
                        string(credentialsId: 'your-jenkins-aws-credentials-id', variable: 'AWS_ACCESS_KEY_ID'),
                        string(credentialsId: 'your-jenkins-aws-credentials-id', variable: 'AWS_SECRET_ACCESS_KEY')
                    ]) {
                        // Navigate to the terraform directory
                        dir('terraform') {
                            sh 'terraform init'
                            // The image tag is not directly used here because the terraform config
                            // points to ':latest'. Terraform will detect a change in the task
                            // definition if the image digest for ':latest' has changed.
                            // A more robust approach is to pass the image tag as a variable.
                            sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Deployment pipeline finished.'
        }
    }
}
