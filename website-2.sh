#!/bin/bash
# Update and install HTTP server
yum update -y
yum install -y httpd

# Start the HTTP server and enable it to start on boot
systemctl start httpd.service
systemctl enable httpd.service

# Fetch instance metadata using IMDSv2
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
REGION_CODE=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/region)

# Manually map the region code to a full name
declare -A REGION_NAMES=( ["eu-west-1"]="Europe (Ireland)" ["us-east-1"]="US East (N. Virginia)" ["us-west-1"]="US West (N. California)" )
REGION_NAME=${REGION_NAMES[$REGION_CODE]}

# Check if the region name was found, if not, fall back to the region code
if [ -z "$REGION_NAME" ]; then
  REGION_NAME=$REGION_CODE
fi

# Create a simple HTML page with background color #E4E3C1
cat <<EOF > /var/www/html/index.html
<html>
<head>
    <title>EC2 Instance Info</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            background-color: #E4E3C1; /* Background color set to Tomato */
            color: black; /* Text color set to black for better visibility */
        }
        h1 {
            margin-top: 50px;
        }
        p {
            font-size: 20px;
        }
    </style>
</head>
<body>
    <h1>Instance Information</h1>
    <p>Availability Zone: ${AZ}</p>
    <p>Region: ${REGION_NAME}</p>
</body>
</html>
EOF
