# Generate a pair of SSH keys, if you want your Cloud9 env to be able to push changes to the Github repo
ssh-keygen -t rsa
# View the contents of the public key
cat /home/ec2-user/.ssh/id_rsa.pub

// connect by SSH

which ssh-agent
# sudo apt-get install openssh-client
# sudo yum install openssh-clients
# brew install openssh

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa # public key

#  ==============

cd DevOps_Microservices/Supporting-material
# The instructor shows `cd awslambda` per hierarchy of his personal repo
df -h #Check Disk Space:
chmod +x resize.sh # Change Permissions:
./resize.sh  # Execute Script:
df -h  #Check Disk Space Again:
cd ..

cat ~/.ssh/id_rsa.pub


# https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-getting-started-hello-world.html
sam init
sam build --use-container
sam deploy --guided
curl https://ets1gv8lxi.execute-api.us-west-2.amazonaws.com/Prod/hello/
{"message": "hello world"}
sam remote invoke HelloWorldFunction --stack-name sam-app

sam remote invoke HelloWorldFunction --stack-name sam-app

Invoking Lambda Function HelloWorldFunction                                       
START RequestId: d5ef494b-5f45-4086-86fd-d7322fa1a1f9 Version: $LATEST
END RequestId: d5ef494b-5f45-4086-86fd-d7322fa1a1f9
REPORT RequestId: d5ef494b-5f45-4086-86fd-d7322fa1a1f9  Duration: 6.62 ms       Billed Duration: 7 ms     Memory Size: 128 MB     Max Memory Used: 67 MB  Init Duration: 164.06 ms
{"statusCode":200,"body":"{\"message\":\"hello world\"}"}% 


cd [Application-name]/hello world 
python3 -m venv ~/.myvenv
source ~/.myvenv/bin/activate
python3 -m pip install -r requirements.txt


# Assuming you have updated the app.py, requirement.txt, 
# Assumnig you have created the  [Application-name]/payload.json file
cd [Lambda-function-name]
sam build
sam local invoke -e payload.json
# If you were doing this development in your physical local machine and want to test more, use: 
sam local start-api
# It will generate an API endpoint tha you can curl in s diiffernt terminal window. 

# https://noahgift.github.io/cloud-data-analysis-at-scale/