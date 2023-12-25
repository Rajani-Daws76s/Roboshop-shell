#! /bin/bash
AMI=ami-03265a0778a880afb
SG_ID=sg-06461313c2fd409a7
INSTANCES=("mongodb" "redis" "mysql" "catalogue" "cart" "user" "shipping" "payment" 
 "dispatch" "web" "rabitmq")
for i in ${INSTANCES[@]}
do 
  echo "instance : $i"
  if [ $i == "mongodb"] || [ $i == "shipping"] || [ $i == "mysql"]
  then
  INSTANCE_TYPE=t3.medium
  else
  INSTANCE_TYPE=t2.micro
  fi
  aws ec2 run-instances --image-id ami-03265a0778a880afb  --instance-type $INSTANCE_TYPE 
  --security-group-ids  sg-06461313c2fd409a7
done
