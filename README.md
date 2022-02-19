# Coalfire Technical Asssessment

Attached are the files I used to create a solution within a VPC

1.) VPC:
Set up a VPC using CIDR block 10.1.0.0/16

2.) Subnets:
Created a number of subnets that live within the VPC CIDR block, two of these subnets are accessible from the internet and two of these subnets are not.

3.) sub4:
Created a .tf file that is responsible for standing up an EC2 file using an AMI, the .tf script also configures the newly created EC2 instance

4.) ASG
Created another .tf file that created an auto scaling group on subnet4. The code also specifies the launch configuration to use, amount of storage, instance type and the minimum and maximum amount of hosts

5.) ALB
Another .tf file was created that set up an application load balancer that listened on port 80 and then sent requests to instances located on subnet (subnets had security groups based on code written in provider.tf)

6.) S3 Bucket
Created s3 bucket with lifestyle policies that looked for images/ folder and move to glacier storage after 80 day. The other lifecycle policy looked for the logs/ folder and deleted logs after 90 days

# Additional thoughts/actions

1.) Created EBS and attached it to the EC2 instance to increase space

2.) Removed the access_key and secret_key from the configuration files to ensure that they are not exposed

3.) Modules were used in Terraform code

4.) Breaking up the Terraform code into components is ideal in an IaaC situation. While creating this solution, split out each component into its own configuration file - this reduces the complexity of maintaing large amounts of code in one place.

# Running the code

1.) To run this automated deployment, first ensure that you have Terraform installed on your machine

2.) Open up your terminal and run "terraform init" to initialize the code, download modules, plugins, etc.

3.) Next, run "terraform plan" in your terminal to preview the changes that you are about to make to your Terraform code

4.) Once satisified with changes, run "terraform apply" to begin automated deployment of AWS (or other cloud provider) infrastructure

# Note on S3 Buckets

Terraform AWS Provider is upgraded to version 4.0.0 which is published on 10 February 2022.

Major changes in the release include:

Version 4.0.0 of the AWS Provider introduces significant changes to the aws_s3_bucket resource.
Version 4.0.0 of the AWS Provider will be the last major version to support EC2-Classic resources as AWS plans to fully retire EC2-Classic Networking. See the AWS News Blog for additional details.
Version 4.0.0 and 4.x.x versions of the AWS Provider will be the last versions compatible with Terraform 0.12-0.15.
The reason for this change by Terraform is as follows: To help distribute the management of S3 bucket settings via independent resources, various arguments and attributes in the aws_s3_bucket resource have become read-only. Configurations dependent on these arguments should be updated to use the corresponding aws_s3_bucket_* resource. Once updated, new aws_s3_bucket_* resources should be imported into Terraform state.


-> To get around this issue the lifecycle terraform code must be altered to use _rule_ instead of _lifecycle_rule_


Guide here: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-4-upgrade#s3-bucket-refactor
