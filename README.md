Terraform – Part 3 🚀
This project is part of my ongoing Terraform learning journey. 
In Part 3, I focused on Terraform State & Backends, learning how to manage infrastructure reliably and collaboratively.

#What I Learned
1.The role of Terraform state in tracking resources.
2.How to implement secure state management best practices.
3.Using remote state backends with AWS S3 for centralized storage.
4.Setting up state locking with DynamoDB to prevent conflicts in multi-user environments.

#How to Use
Clone the repository:
git clone https://github.com/Mujtaba-DevOps/Terraform-Part-3.git
cd Terraform-Part-3

Initialize Terraform:
terraform init
Apply the configuration:
terraform apply

Verify resources:
Check the S3 bucket for the Terraform state.
Check the DynamoDB table for state locking.
Destroy resources safely (if needed):
terraform destroy
