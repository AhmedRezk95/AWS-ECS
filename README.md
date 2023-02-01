# AWS-ECS
Create ECS Cluster with EC2 using terraform with connected RDS 

## Steps:
1- Create Network module for the whole infrastructure (1 VPC, 2 private subnets, 2 public subnets, elastic ip, internet gateway, NAT)

2- For ECS with RDS you will need to create specifics IAM roles in order to make RDS and ECS talk to each other

3- Create ECS Cluster, task definition, service and task sets