
# Create a PUBLIC bucket in the S3, and verify locally as 
aws s3api list-buckets 
# Download and unzip the udacity-starter-website.zip 
cd udacity-starter-website 
# Create Bucket
aws s3api  create-bucket --bucket bucket-cli --acl public-read-write --region us-east-2 --profile Udacity
aws s3api  create-bucket --bucket bucket-cli --acl public-read-write --region us-east-2 --profile ansible

# Assuming the bucket name is my-bucket-202203081 and your PWD is the "udacity-starter-website" folder 
# Put a single file. 
aws s3api put-object --bucket BucketCli --key index.html --body index.html 
# Copy over folders from local to S3 
aws s3 cp vendor s3://upload-static-vietnv17/vendor --recursive 
aws s3 cp css/ s3://my-bucket-202203081/css/ --recursive 
aws s3 cp img/ s3://my-bucket-202203081/img/ --recursive 
# --recursive (boolean) Command is performed on all files or objects under the specified directory or prefix.
aws s3 rm  s3://upload-static-vietnv17/img/ --recursive 
{
    "Buckets": [
        {
            "Name": "aws-cloudtrail-logs-524449710155-e7350256",
            "CreationDate": "2023-03-22T04:09:29+00:00"
        },
        {
            "Name": "aws-cloudtrail-logs-524449710155-f58cf35a",
            "CreationDate": "2023-03-22T04:07:11+00:00"
        },
        {
            "Name": "cf-templates-1x6d5yd9ttlyq-us-east-1",
            "CreationDate": "2023-03-29T16:27:59+00:00"
        },
        {
            "Name": "upload-static-vietnv17",
            "CreationDate": "2023-03-30T10:31:28+00:00"
        }
    ],
    "Owner": {
        "ID": "bfff4b44f56e6b0f8824d62409ecb50f4839d5147194f7a6c393728e3c619c96"
    }
}  "CreationDate": "2023-03-30T10:31:28+00:00"


aws s3api put-object --bucket vietnv17-bucket --key vpc.yml --body vpc.yml 
