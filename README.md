# Coalfire Technical Asssessment

Attached are the files I used to create a solution within a VPC

1.) VPC:
I set up a VPC using CIDR block 10.1.0.0/16

2.) Subnets:
I then created a number of subnets that live within the VPC CIDR block, two of these subnets are accessible from the internet and two of these subnets are not.

3.) sub4:
I created a .tf file that is responsible for standing up an EC2 file using an AMI, the .tf script also configures the newly created EC2 instance

4.) ASG
I created another .tf file that created an auto scaling group on subnet4. The code also specifies the launch configuration to use, amount of storage, instance type and the minimum and maximum amount of hosts

5.) ALB
Another .tf file was created that set up an application load balancer that listened on port 80 and then sent requests to instances located on subnet (subnets had security groups based on code written in provider.tf)

6.) S3 Bucket
Created s3 bucket with lifestyle policies that looked for images/ folder and move to glacier storage after 80 day. The other lifecycle policy looked for the logs/ folder and deleted logs after 90 days

# Additional thoughts/actions

1.) I went ahead and created EBS and attached it to the EC2 instance to increase space

2.) I have gone ahead and removed the access_key and secret_key from the configuration files to ensure that they are not exposed

3.) Modules were used in Terraform code

4.) Breaking up the Terraform code into components is ideal in an IaaC situation. While creating this solution, I split out each component into its own configuration file - this reduces the complexity of maintaing large amounts of code in one place.

# Running the code

1.) To run this automated deployment, first ensure that you have Terraform installed on your machine

2.) Open up your terminal and run "terraform init" to initialize the code, download modules, plugins, etc.

3.) Next, run "terraform plan" in your terminal to preview the changes that you are about to make to your Terraform code

4.) Once satisified with changes, run "terraform apply" to begin automated deployment of AWS (or other cloud provider) infrastructure
