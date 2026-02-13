# 🌐 Custom VPC with Public & Private Subnets using Terraform

This project creates a fully functional **Custom VPC architecture on AWS** using Terraform.

It includes:

- Custom VPC (192.168.0.0/16)
- Public Subnet
- Private Subnet
- Internet Gateway
- Route Tables
- Security Group
- EC2 Instance in Public Subnet

---

# 🏗 Architecture Overview

```

VPC (192.168.0.0/16)
│
├── Public Subnet (192.168.1.0/24)
│     └── EC2 (with Public IP)
│
├── Private Subnet (192.168.2.0/24)
│
├── Internet Gateway
│
└── Route Tables
      ├── Public RT → IGW
      └── Private RT → No Internet

```
---

# 🎯 Why This Project?

This project demonstrates:

- Custom networking in AWS
- Public vs Private subnet design
- Secure EC2 deployment
- Infrastructure as Code (IaC) using Terraform

This is a core DevOps & Cloud Engineer skill.

---

# 🛠 Prerequisites

Before running this project, make sure you have:

1. AWS Account
2. AWS CLI installed
3. Terraform installed
4. AWS CLI configured

Check versions:

```
terraform -v  
aws --version  
```
---

# 🔐 Step 1 – Configure AWS CLI

Run:
```
aws configure
```
Enter:

- AWS Access Key
- AWS Secret Key
- Region (example: ap-south-1)
- Output format (json)

---

# 📂 Step 2 – Clone the Repository

```
git clone https://github.com/YOUR-USERNAME/custom-vpc-terraform.git

cd custom-vpc-terraform
```
---

# ⚙ Step 3 – Initialize Terraform
```
terraform init
```
This downloads required AWS provider plugins.

---

# 📋 Step 4 – Validate Code
```
terraform validate
```
---

# 🔎 Step 5 – Check Plan
```
terraform plan
```
This shows what Terraform will create.

---

# 🚀 Step 6 – Deploy Infrastructure
```
terraform apply
```
Type:

yes

Terraform will create:

- VPC
- Subnets
- Internet Gateway
- Route Tables
- Security Group
- EC2 Instance

---

# 🌍 Step 7 – Access EC2

After apply completes:

1. Go to AWS Console
2. Open EC2
3. Copy Public IP
4. Connect using:

ssh -i your-key.pem ubuntu@PUBLIC-IP

---

# 🧹 Step 8 – Destroy Infrastructure (Important)

To avoid AWS charges:
```
terraform destroy
```
Type:

yes

This removes everything created.

---

# 📌 CIDR Design

VPC CIDR: 192.168.0.0/16

Public Subnet: 192.168.1.0/24  
Private Subnet: 192.168.2.0/24  

We did NOT use default VPC (172.31.0.0/16).

This shows real-world custom networking knowledge.

---

# 🔐 Security Design

- SSH restricted to specific IP
- Private subnet has no internet route
- Custom Security Group attached to EC2

---

# 📈 Scalability

This architecture can be extended to:

- Add NAT Gateway
- Add Auto Scaling Group
- Add Application Load Balancer
- Convert to 3-tier architecture

---

# 💰 Cost Optimization

- Only 1 EC2 instance
- No NAT Gateway used
- Free-tier eligible instance type (t2.micro)

---

# 🤖 Automation

Everything is deployed using Terraform.

No manual AWS Console configuration.

---

# 🏁 Conclusion

This project demonstrates:

- AWS Networking fundamentals
- Terraform Infrastructure as Code
- Secure EC2 deployment
- Production-style architecture foundation

---