#!/bin/bash

# Array of service names (container names)
services=(
  "booking_service"
  "gateway_service"
  "hotel_service"
  "loyalty_service"
  "payment_service"
  "rating_service"
  "report_service"
  "session_service"
)

# Stop and remove running containers
for service in "${services[@]}"; do
  container_id=$(docker ps -a -q --filter="name=$service")
  if [ ! -z "$container_id" ]; then
    echo "Stopping and removing container for $service..."
    docker stop "$container_id"
    docker rm "$container_id"
  else
    echo "No container found for $service."
  fi
done

echo "All done!"
