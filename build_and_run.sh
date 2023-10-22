#!/bin/bash

# Array of services with proper case for folder names
folders=(
  "Booking_Service"
  "Session_Service"
  "Gateway_Service"
  "Hotel_Service"
  "Loyalty_Service"
  "Payment_Service"
  "Rating_Service"
  "Report_Service"
)

# Convert folder names to lowercase for image names
services=("${folders[@],,}")

declare -A ports=(
  ["booking_service"]="8003"
  ["session_service"]="8001"
  ["gateway_service"]="8005"
  ["hotel_service"]="8004"
  ["loyalty_service"]="8000"
  ["payment_service"]="8002"
  ["rating_service"]="8007"
  ["report_service"]="8006"
  
)

# Modify the DB_HOST and HOST_ADDRESS environment variables
# to the desired values
NEW_DB_HOST="ec2-3-38-173-94.ap-northeast-2.compute.amazonaws.com"
NEW_HOST_ADDRESS="ec2-3-38-173-94.ap-northeast-2.compute.amazonaws.com"

# Build images
for index in "${!services[@]}"; do
  folder=${folders[$index]}
  service=${services[$index]}
  echo "Building $service image..."
  
  # Modify the environment variables before building the image
  sed -i "s/ENV DB_HOST=.*/ENV DB_HOST=$NEW_DB_HOST/" ./"$folder"/Dockerfile
  sed -i "s/ENV HOST_ADDRESS=.*/ENV HOST_ADDRESS=$NEW_HOST_ADDRESS/" ./"$folder"/Dockerfile

  docker build -t "${service}_image" ./"$folder"
done

# Restore the original Dockerfile by reverting the changes
for index in "${!services[@]}"; do
  folder=${folders[$index]}
  service=${services[$index]}
  echo "Restoring original Dockerfile for $service..."

  # Replace the modified environment variables with the original values
  sed -i "s/ENV DB_HOST=.*/ENV DB_HOST=ec2-43-202-110-191.ap-northeast-2.compute.amazonaws.com/" ./"$folder"/Dockerfile
  sed -i "s/ENV HOST_ADDRESS=.*/ENV HOST_ADDRESS=ec2-43-202-110-191.ap-northeast-2.compute.amazonaws.com/" ./"$folder"/Dockerfile
done

# Migrate databases for services
for service in "${services[@]}"; do
  echo "--------Running migrate for $service...---------"
  docker run "${service}_image" python3.9 manage.py migrate
  echo "---------- Eed migrate for $service...----------"
done

for service in "${services[@]}"; do
  port=${ports[$service]}
  echo "Running $service on port $port..."
  docker run -d  --name "$service" -p "$port:$port" "${service}_image"
done

echo "All done!"
