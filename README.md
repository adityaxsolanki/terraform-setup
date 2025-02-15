# 🚀 Terraform ASG + ALB Setup

## 📌 Project Overview
This project sets up an **Auto Scaling Group (ASG) with an Application Load Balancer (ALB)** using Terraform on AWS. It ensures high availability, automatic scaling, and efficient load distribution for your EC2 instances.

## 🏗 Architecture Diagram
![Architecture]!(https://github.com/user-attachments/assets/77161696-abd9-4dcb-8306-5a2f103ab797)

## 🎯 Key Features
✅ **Auto Scaling:** Dynamically adjusts EC2 instances based on load.
✅ **Load Balancing:** Distributes traffic efficiently using ALB.
✅ **Infrastructure as Code (IaC):** Fully automated setup with Terraform.
✅ **Cost Optimization:** Uses on-demand instances with scaling policies.

## ⚙️ Setup Instructions

### Prerequisites
- AWS CLI configured with IAM credentials.
- Terraform installed (`terraform --version` to check).

### Steps to Deploy
1. Clone the repository:
   ```bash
   git clone https://github.com/adityaxsolanki/terraform-setup.git
   cd terraform-setup
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Plan the infrastructure:
   ```bash
   terraform plan
   ```
4. Apply the changes:
   ```bash
   terraform apply -auto-approve
   ```
5. Get the ALB DNS to test the setup:
   ```bash
   terraform output alb_dns_name
   ```

## 🔍 Infrastructure Details
- **Application Load Balancer (ALB)**
  - Routes traffic to EC2 instances in different AZs.
- **Auto Scaling Group (ASG)**
  - Configured with a Launch Template.
  - Uses Target Tracking Policy to scale dynamically.
- **Security Groups**
  - ALB allows HTTP/HTTPS traffic.
  - EC2 allows traffic only from ALB.

## 🧪 Testing the Setup
- Open the ALB DNS in the browser to check if instances are responding.
- Use the following command to check scaling:
  ```bash
  aws autoscaling describe-auto-scaling-groups --query "AutoScalingGroups[*].{Name:AutoScalingGroupName,Instances:Instances}" --output table
  ```

## 🚀 Future Enhancements
- Add **CI/CD with Jenkins/GitHub Actions**.
- Implement **Blue-Green Deployment**.
- Integrate **AWS WAF** for security.

## 🤝 Contributing
Feel free to raise issues or submit PRs to enhance this project.

---
🔥 Built with Terraform & AWS by **Aditya Solanki**

