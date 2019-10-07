aws s3 cp ./Dockerrun.aws.json \
  s3://elasticbeanstalk-eu-west-2-124429370407/helloFromDocker/Dockerrun.aws.json

aws elasticbeanstalk create-application-version \
  --application-name "helloFromDocker" \
  --version-label helloFromDocker \
  --source-bundle S3Bucket="elasticbeanstalk-eu-west-2-124429370407",S3Key="helloFromDocker/Dockerrun.aws.json" \
  --auto-create-application

aws elasticbeanstalk update-environment \
  --application-name "helloFromDocker" \
  --environment-name "helloFromDocker-prod" \
--version-label helloFromDocker
