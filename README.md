#Terraform and how it is used,installation on various platforms,run and connect to webserver.

**IaC - INFRASTRUCTURE AS CODE**
 
 Before going to learn what is Terraform, lets know what is IaC-Infrastruture as Code.
Suppose if you want to  set up some machines on cloud platform e g.  AWS, AZURE ,GOOGLE CLOUD  etc.
One way is we can loggin to the platform and setup manually using the GUI

Another way is to write the configuration that you need for the infrastructure in a file as a code ,and run the file using IaC tool to create the infrastructure.

IaC  allows to build ,change, and manage the infrastructure in a safe ,consistent and repeatable way.

Now lets know how terraform helps and what is Terraform !?

Terraform is a open-source IaC tool
Can automate the setup and management of the infrastructure  by writing the code e.g. setting up remote machines on cloud platforms like AWS,AZURE,GCP etc..
Terraform uses the special human readable code language (HashiCorp Configuration Language) to define the infrastructure ,making easy to Version control and collaborate with others.

**Install Terraform on Windows**


1. Go to https://developer.hashicorp.com/terraform/install
2. Select windows under the operating Systems
3. Download the zip file
4. Extract the downloaded Zip file to a folder of your choice 
5. Add the folder location of terraform.exe in the Path environment variable
6. Verify using commands 
terraform
terraform version or terraform -v 

**Install Terraform on Mac OS**


1.	Goto https://developer.hashicorp.com/terraform/install
2.	Select MacOS under the Operation Systems
3.	Open terminal and check the homebrew is installed
brew -version     which brew      Can update brew– brew update
4.	If not install homebrew go to terminal and run 
/bin/bash -c “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)”
5.	Install terraform using commands 
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

 **Install Terraform on MaC OS using Binary files**
 
 
1.	Goto https://developer.hashicorp.com/terraform/install
2.	Select MaCOS under the Operating System
3.	Download the Binary file(use ARM64 file if using MaCOS with Apple M1 M2 chip)
4.	Extract the downloaded Zip file to a folder of your choice
5.	Add the folder location of terraform in the Path  environment variable
To do This we have 2 options
1.	Move the Terraform binary in a folder location which is already set in PATH env variable
   
 1. Open the terminal and run command echo $PATH
 2. Identify a suitable location (e g. /usr/local/bin) where you want to place the Terraform binary
 3. Move the binary-assuming the Terraform binary is currently in your downloads folder use command to  move It to the chosen location
mv ~/Downloads/terraform/usr/local/bin/
 4. Verify using commands
terraform 
terraform version or terraform -v
terraform help

2.	Manually add the path of Terraform binary in the PATH env variable
	
 1. Go to Terminal

 2. Add Path in .bash_profile (old macs)

Or  .zshrc(new macs)

Check what is our default Shell echo $SHELL

For e.g for a command echo $SHELL you got response as /bin/zsh

That means your default shell is zsh (also called Z shell) and you will add env variables In file  .zshrc

(Else your default shell will be bash and you will add all env variables in file .bash_profile. And if that is the case just replace .zshrc with .bash_profile in all below commands)


Now assuming the default shell is Zsh and we need to add env variables in .zshrc file 

Open Terminal

Run command open .zshrc

In case the file does not already exist, create the file touch  ~/.zshrc

This command creates the .zshrc file in your home directory (~)

Now to edit .zshrc file we have 2 options

1.   On terminal ,run command open .zshrc
This should open the file in a text editor where you can edit and save it.
Add the env variablles and save the file

2.  If option 1 does not work ,On terminal,run command cat .zshrc
This  will show the contents of the file on the terminal itself

Now  use vi editor to edit the file

Run command vi .zshrc this will open file in vi editor

Press i on keyboard to go into insert mode

Now add the env variables as shown below (make sure to update the paths as per your system)

export PATH=$PATH:$path/of/terraform 


After editing press Escape key on the keyboard
Now write wq! And hit Enter.This will write and quite
To check the paths are set,open a new terminal and run commands 
cat .zshrc
Echo $PATH

Verify using commands 
terraform
terraform version or terraform -v 




**Install Terraform in Linux**



1.	Connect to your Linux machine 
2.	Goto https://developer.hashicorp.com/terraform/install
3.	Select Linux under the Operating Systems
4.	Select the Linux distribution
5.	Use the corresponding commands Or download zip file to install Terraform
6.	Verify using commands
terraform
terraform version or terraform -v
terraform -help


**Create a Project**


1.	Create a folder for your Terraform project ( e.g  in my case I gave Terraform folder1)
2.	Now for further steps you can use any text editor or IDE like VS code 
3.	Inside this folder , create a file name main.tf
This file will contain your Terraform Configuration



**Create Configuration file**



1.	Inside the project folder create a file main.tf

*************
It is not mandatory to name the Terraform Configuration file main.tf

While main.tf is a common configuration ,Terraform doesn’t actually care much about filenames it loads  all .tf files

However , using naming conventions like main.tf , variables.tf , and outputs.tf can , make it easier for developers to navigate the code.

************


Decide Provider and mention in Config file



Check list of providers here https://registry.terraform.io/search/providers?namespace=hashicorp

Assuming we are using AWS provider , login to your AWS account or create a new account

Check aws  example config – https://registry.terraform.io/providers/hashicorp/aws/latest/docs

In your main.tf file add a provider block for AWS

(Optionally , we can declare the providers in a separate file providers.tf)

#main.tf

Provider “aws”{
region = “us-east-1”
access_key = “your access key”
secret_key = “ your secret key”
}

To authenticate Terraform with your aws account , you’ll need to set your aws credentials


**Creating security credentials on AWS**


1.	Login to your AWS account
2.	Goto Services > IAM
3.	In the IAM dashboard , click on “Users” in the left navigation pane
4.	Select an existing user or create a new user
5.	Add Permission AmazonEC2FullAccess to the user
6.	Goto the Security Credentials tab & scroll down to the Access keys section
7.	Click on Create access key
8.	A new access key ID and secret access key will be generated
9.	You can also assign permission to this user as needed
Save file and run command terraform init then terraform validate 
 It is not a good practice to hard code your provider (aws) security credentials in the configuration file (main.tf)

Check   the options to store and refer credentials here
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build

terraform providers  - displays a tree of providers used in the configuration file





Add infrastructure details in config file


1.	 Get a sample configuration for your provider from terraform examples
https://registry.terraform.io/providers/hashicorp/aws/latest/docs
2.	Add the required details in the config file
For e.g. EC2 infrastructure 
#main.tf
resource “aws_instance” “web_server” {
ami = “edit with your own ami value”
instance_type = “t2.micro”
tags = {
Name = “Example_for_EC2instancce”
}
}

3.	Run terraform validate
[ for a new project or new config run this command after terraform init]


**Run terraform init**


1.	Open your terminal or command prompt and navigate to your project directory
2.	Run terraform init
This command downloads necessary provider plugins
It is the first command you should run after writing a new Terraform configuration or cloning an existing one from version control

You can safely run this command multiple times during your project’s lifecycle


**Run terraform plan**


1. Run terraform plan
   
2. It generates an execution plan without actually applying changes
   
3. It allows you to see the proposed modifications before actually applying them
Review the plan to ensure it aligns with your expections

You can use the optional -out=File option to save the generated plan file terraform plan -out=myplan

This will create a plan file named myplan

This contains details on the actions Terraform plans to take including any resource changes , additions , deletions etc

This can be useful to review the changes later or share it with others and get feedback

terraform show mypaln                  terraform show myplan > myplan.txt

To apply the plan later, use following command: terraform apply myplan


**Run terraform apply**


1.	When you are ready to create real infrastructure run : terraform apply
   
2.	Confirm by typing ‘yes’ when prompted
   
Terraform will provision the resources defined in your configuration
3.	Check the infrastructure created

4.	Try changing same parameters in config file main.tf and run command
   
terraform refresh – (optional) query provider to get the current state

terraform plan

terraform apply

terraform apply  -auto-approve skips the approval step , useful in automation CI/CD pipelines

terraform apply -var=”instance_type=t2.large” Can provide values pf variables during apply





   
**Run terraform show**


1.	Verify that your resource (e.g. AWS EC2 instance)are created as expected
	
2.	Can check AWS console or use Terraform command terraform show
	
terraform show -json shows output in json format

terraform show provides human-readable output from either a state file or a plan file
Allows you to inspect the current state of your infrastructure . Shows the latest state snapshot

terraform -help                        shows all commands

terraform show -help             shows details of the specific command with options







terraform.tfstate file in your project store state about your managed infrastructure  and configuration

Imagine you’re building a house using Lego blocks.Each block represents a resource (like a virtual machine, database , network etc)

The terraform state is like a blueprint that keeps track of which Lego blocks you have used and how they fit together

When you create or modify resources using Terraform ,it updates this blueprint

terraform state command with options to perform basic modification of the state

**Run terraform destroy**


Used  to remove the infrastructure managed by Terraform

1.	Run command terraform destroy confirm by typing ‘yes’
	
2.	Can check AWS console or use Terraform command terraform show 

**Terraform Variables – variables.tf | terraform.tfvars**


We can use variables to reuse values in terraform configuration file
This also helps to make changes easier without changing the value at multiple places
Use variable to parameterize your congifuration

#variables.tf

variable "instance_type" {

  description = "ec2 instance type"
  
  type        = string
  
  default = "t3.micro"
  
}
1.	We can declare and define variables within main.tf file
2.	We can use a saperate file variables.tf
3.	Can create a file terraform.tfvars to separately store the values
   
#terraform.tfvars

access_key = "give your access key"

secret_key = "secret key"

ami_id = "edit your ami id"

Terraform outputs – outputs.tf


In this file , we define output values that can be referenced by other modules or external systems

For example we create an output for public IP address of EC2 instance

#outputs.tf

output "instance_ip_addr" {

  value = aws_instance.ec2_instance1.public_ip
  
}




