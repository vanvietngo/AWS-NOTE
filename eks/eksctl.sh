# eksctl Installation

# linux:
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Mac using Homebrew:
# Check Homebrew 
brew --version
# If you do not have Homebrew installed - https://brew.sh/ 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install eksctl
brew tap weaveworks/tap
brew install weaveworks/tap/eksctl

# Windows using Powershell terminal:
# Install Chocolatey. Refer to the https://chocolatey.org/install  for detailed steps
Set-ExecutionPolicy AllSigned 
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Exit and re-run Powershell as an Admin
chocolatey install eksctl
# Verify
choco -?

# Create a basic cluster:
eksctl create cluster
# A cluster will be created with default parameters, such as:

# An auto-generated name
# Two m5.large worker nodes. Recall that the worker nodes are the virtual machines, and the m5.large type defines that each VM will have 2 vCPUs, 8 GiB memory, and up to 10 Gbps network bandwidth.
# Use the Linux AMIs as the underlying machine image
# Your default region
# A dedicated VPC
# However, you can specify all the above details explicitly, for example:

eksctl create cluster --name myCluster --nodes=4

# Create an advanced cluster
eksctl create cluster --config-file=<path>
# https://eksctl.io/

# List the details
eksctl get cluster [--name=<name>][--region=<region>]
# Delete a cluster
eksctl delete cluster --name=<name> [--region=<region>]

eksctl create cluster --name eksctl-demo --region=us-east-2 [--profile <profile-name>]

# View progress
eksctl utils describe-stacks --region=us-east-2 --cluster=eksctl-demo [--profile <profile-name>]

# View details
eksctl get cluster --name=eksctl-demo --region=us-east-2 [--profile <profile-name>]

# You can also check the health of your clusters nodes using the command:
kubectl get nodes  [--profile <profile-name>]

# Delete using the EKSCTL:

eksctl utils describe-stacks --region=us-east-2 --cluster=eksctl-demo --profile Eks  --output json | jq

# ########################
# ########################

## Assuming you have already cloned the course repo as
# git clone:
git clone https://github.com/udacity/DevOps_Microservices.git
## Move to the exercise folder if you want to write Dockerfile from scratch
cd DevOps_Microservices/Lesson-3-Containerization/python-helloworld

# Once you are in the right folder, run these commands and read the inline comments carefully.
## Ensure Docker Desktop is running locally
docker --version
## Build an image using the Dockerfile in the current directory
docker build -t python-helloworld .
docker images
## Run a container
# 8080: host ; 5000: container
docker run -d -p 8080:5000 python-helloworld
## Check the output at http://localhost:5000/ or http://0.0.0.0:5000/ or http://127.0.0.1:5000/
docker ps
## Now, stop the container.
## Tag locally before pushing to the Dockerhub
## We have used a sample Dockerhub profile /sudkul
## Replace sudkul/ with your Dockerhub profile
docker tag python-helloworld-m2 vanvietonline/python-helloworld-m2:v1.0.0
docker images
## Log into the Dockerhub from your local terminal
docker login
## Replace sudkul/ with your Dockerhub profile
docker push vanvietonline/python-helloworld-m2:v1.0.0
## Check the image in your Dockerhub online at https://hub.docker.com/repository/docker/sudkul/python-helloworld

# Once your Docker image is publicly available, you can deploy it to the kubernetes cluster.
## Assuming the Kubernetes cluster is ready
kubectl get nodes
## Deploy an App from the Dockerhub to the Kubernetes Cluster
kubectl create deploy python-helloworld-m2 --image=sudkul/python-helloworld-m2:v1.0.0
## See the status
kubectl get deploy,rs,svc,pods
## Port forward 
kubectl port-forward pod/python-helloworld-84857d9565-2598m --address 0.0.0.0 8000:5000 
# port local: 8000

eksctl delete cluster --region=us-east-2 --name=eksctl-demo [--profile <profile-name>]


