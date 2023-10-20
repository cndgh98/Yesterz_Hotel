#!/bin/bash

# Array of services with proper case for folder names
folders=(
  "Booking_Service"
  "Gateway_Service"
  "Hotel_Service"
  "Loyalty_Service"
  "Payment_Service"
  "Rating_Service"
  "Report_Service"
  "Session_Service"
)

# Convert folder names to lowercase for image names
services=("${folders[@],,}")

# # Build images
# for index in "${!services[@]}"; do
#   folder=${folders[$index]}
#   service=${services[$index]}
#   echo "Building $service image..."
#   docker build -t "${service}_image" ./"$folder"
# done

# Migrate databases for services
for service in "${services[@]}"; do
  echo "Running migrate for $service..."
  docker run "${service}_image" python3.9 manage.py migrate
done

echo "All done!"

# chmod +x build_and_run.sh
# ./build_and_run.sh
