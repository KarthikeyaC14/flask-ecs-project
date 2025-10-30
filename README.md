# flask-ecs-project
Overview :

This project demonstrates deploying a Flask application on AWS using containerization with Docker, orchestration via AWS ECS (Elastic Container Service), infrastructure provisioning via Terraform, and CI/CD using Jenkins.
It is intended as a full end-to-end “DevOps + Cloud” demo for a micro-service style app: from code → container → infra → deploy → run.


Features :

A Python Flask web application.
Dockerfile to containerize the Flask app.
Terraform scripts to provision AWS infrastructure (ECS cluster, task definitions, VPC/subnets, etc).
Jenkinsfile to define a CI/CD pipeline (build image → push to registry → deploy to ECS).
.github/workflows directory for GitHub actions (if applicable) for further automation.
Infrastructure as Code (IaC) and container orchestration best practices.


Architecture :

Developer pushes code to GitHub.
Jenkins (or GitHub Actions) triggers the pipeline:
1. Build the Docker image from Dockerfile.
2. Push the image to a container registry (ECR or similar).
3. Trigger Terraform to apply changes if needed (or use Terraform manually).
4. Deploy the container image to AWS ECS (Fargate or EC2 launch type).
5. The Flask app is accessible over HTTP in the AWS environment.
6. Terraform manages underlying infrastructure: VPC, subnets, ECS cluster, task definitions, IAM roles.
7. Monitoring/logging can be added (not included by default) for production readiness.


Directory Structure : 

├── app/                  # Flask application source code
│   ├── main.py
│   ├── requirements.txt
│   └── …
├── Dockerfile            # Container definition
├── Jenkinsfile           # CI/CD pipeline definition
├── terraform/            # Infrastructure as Code for AWS
│   ├── main.tf
│   ├── variables.tf
│   └── …
└── .github/
    └── workflows/        # GitHub Actions workflows
