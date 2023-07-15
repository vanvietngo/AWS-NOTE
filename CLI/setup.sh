# After installing AWS CLI, recall that you must configure the following four items on your local machine before you can interact with any of the AWS services:

# Access key - It is a combination of Access Key ID and a Secret Access Key. You can generate an Access key from the AWS IAM service, and specify the level of permissions (authorization) with the help of IAM Roles.

# Default AWS Region - It specifies the AWS Region where you want to send your requests by default.

# Default output format - It specifies how the results are formatted. It can either be a json, yaml, text, or a table.

# Profile - A collection of settings is called a profile. The default profile name is default, however, you can create a new profile using the aws configure --profile new_name command.

# https://docs.aws.amazon.com/AmazonS3/latest/userguide/HostingWebsiteOnS3Setup.html#step4-add-bucket-policy-make-content-public


# Configuring the AWS Command Line Interface (CLI)
# Assuming you have already installed the AWS CLI tool and copied the access key for an administrator IAM user, follow the steps below:

# Verify, if you already have a CLI v1 installed. If yes, prefer to uninstall CLI v1 and have CLI v2 installed, which is the latest one. You can verify the version using:
aws --version
# To set up your AWS CLI, type either of the following commands in the terminal:
aws configure
aws configure --profile default
# Upon prompt:

# Paste the copied access key (access key id and secret access key).
# Enter the default region either as as us-east-1 or us-west-2, even if you’re living closer to another available region.
# Enter the output format either as json or leave it blank


# Verify the AWS CLI configuration
aws configure list
aws configure 
aws configure set aws_session_token "<TOKEN>" --profile default 
# AWS tools to use the credentials and configurations associated with that profile.
$ export AWS_PROFILE=Ansible

# 
aws configure list-profiles
