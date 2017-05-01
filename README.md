![AyeAye](https://github.com/devops-recipes/provision-aws-terraform/blob/master/public/resources/images/captain.png)

# Infrastructure provisioning on AWS with Terraform within your Shippable pipeline 

A Shippable pipeline for provisioning and terminating instances on Amazon EC/2 
using Terraform.

This repo demonstrates the following features:
* Set up a CD pipeline to provision and terminate Amazon EC/2 instances 
* Use of Terraform to perform the provision and terminate jobs in a Shippable 
pipeline
* Use of `runCLI` jobs in a Shippable pipeline
* Saving and restoring state from one job to subsequent jobs

## Prerequisites to run this sample
* Source control account (e.g. GitHub, Bitbucket, Gitlab)
* Shippable account (sign up for free at www.shippable.com)
* Amazon Web Services account (aws.amazon.com)

## Setup
* Fork this repo to your source control account
* Follow the [instructions](insert link) to store your AWS credentials needed 
for this sample in Shippable
* All pipeline config is in `shippable.resources.yml` and `shippable.jobs.yml`. 
Check these files and update config wherever the comment asks you to replace 
with your specific values (for example, to replace with your Integration names)
* Specifications for the instances that will be launched in AWS can be found in 
`terraform.tf`. Update these, as appropriate.
* Add the pipeline to your SPOG view in Shippable:
  * Select your subscription from the dropdown menu in upper left (three 
  horizontal lines)
  * Select the **Pipelines** tab
  * Select the "+" icon in the upper right
  * Select the source control repo where your fork is 

## Run the pipeline 
* Right-click on the runCLI job in the SPOG view named 'provision_aws_terraform_
provision_ec2' and run the job
  * This demo uses a custom scripting job type called 'runCLI' in Shippable - 
  [learn more about 'runCLI' jobs](http://docs.shippable.com/pipelines/jobs/runCLI/) 
* When your job completes, you should see new EC/2 instances running in your 
AWS account
* Make a change to the instance count in the terraform.tf file and push the 
change to your source control
  * The job will automatically run and update the number of instances in EC/2
* Right-click on the runCLI job named 'provision-aws-terraform-terminate_ec2'
and run the job
* When the job completes, you should now see all of the instances terminated in
EC/2

With this approach, your entire team can easily manage infrastructure 
provisioning as a dedicated pipeline or incorporate on-demand provisioning as a
step in an end-to-end testing scenario.

### AWS integration
![AWS Integration](https://github.com/devops-recipes/provision-aws-terraform/blob/master/public/resources/images/provision-aws-terraform-integration.png)

### runCLI console
![runCLI console](https://github.com/devops-recipes/provision-aws-terraform/blob/master/public/resources/images/provision-aws-terraform-runcli.png)

### CD pipeline screenshot
![CD Pipeline](https://github.com/devops-recipes/provision-aws-terraform/blob/master/public/resources/images/provision-aws-terraform-pipeline.png) 

