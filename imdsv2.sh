TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s "http://169.254.169.254/latest/meta-data/instance-id")
PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s "http://169.254.169.254/latest/meta-data/local-ipv4")
ls
echo $BASH_SOURCE
sed -i 's/INSTANCE-ID-FOR-THIS-EC2/$INSTANCE_ID/g' /index.html 
sed -i 's/INSTANCE-PRIVATE-IP/$PRIVATE_IP/g' /index.html 