# AWS EKS with ALB using Terraform 🚀  

## 📌 Description  
This project provisions an **Amazon EKS (Elastic Kubernetes Service) cluster** with an **Application Load Balancer (ALB)** using **Terraform**. The ALB is configured for ingress traffic, providing load balancing and security features.  

## 🎯 Features  
- ✅ **Provision an EKS Cluster** using Terraform  
- ✅ **Deploy AWS ALB Ingress Controller**  
- ✅ **Configure Ingress for Traffic Management**  
- ✅ **Enable SSL/TLS with ACM Certificates**  
- ✅ **Autoscaling for Worker Nodes**  
- ✅ **Secure Cluster with IAM Roles**  

## 🛠️ Tech Stack  
- **Infrastructure as Code:** Terraform  
- **Container Orchestration:** AWS EKS (Kubernetes)  
- **Networking:** AWS ALB, Route 53  
- **Security:** IAM, Security Groups  

## 🚀 Installation & Setup  

### Prerequisites  
Ensure you have the following installed:  
- **Terraform** (≥ v1.3)  
- **AWS CLI** (Configured with IAM permissions)  
- **kubectl** (≥ v1.21)  
- **Helm** (for ALB Ingress Controller)  

### Clone the Repository  
```bash
git clone https://github.com/your-username/aws-eks-alb-terraform.git
cd aws-eks-alb-terraform
Configure Terraform
Initialize Terraform

terraform init
Plan the deployment

terraform plan
Apply the changes

terraform apply -auto-approve
Configure Kubernetes

After deploying the EKS cluster, update your kubeconfig:

aws eks update-kubeconfig --region <your-region> --name <eks-cluster-name>
Deploy the ALB Ingress Controller

helm repo add eks https://aws.github.io/eks-charts  
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  --set clusterName=<eks-cluster-name> \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  -n kube-system

Verify Deployment

Navigate to AWS Console → EKS

Check the EKS Cluster & Worker Nodes

Navigate to EC2 → Load Balancers and find the created ALB

Test your Ingress Controller with:

kubectl get ingress -A


⚙️ Terraform Configuration
This setup includes:

EKS Cluster & Worker Nodes
AWS ALB Ingress Controller
IAM Role & Policies for ALB Controller
Ingress Resource for Load Balancing

🏗️ Deployment
This project supports CI/CD deployment using:

GitHub Actions
AWS CodePipeline

🤝 Contributing
We welcome contributions! Follow these steps:

Fork the repository
Clone your forked repository

git clone https://github.com/sagark4578/aws-eks-alb-terraform.git
cd aws-eks-alb-terraform
Create a new branch

git checkout -b feature-name
Make changes & commit

git add .
git commit -m "Added ALB support for EKS"
Push your changes

git push origin feature-name
Create a Pull Request (PR)
📜 License
This project is licensed under the MIT License.
