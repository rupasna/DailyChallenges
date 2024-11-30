#!/bin/bash

log_file="user_activity.log"

echo "===== Summary Report ====="

# Total Unique Users
echo "Total Unique Users:"
awk '{ for (i = 1; i <= NF; i++) if ($i ~ /user=/) print $i }' "$log_file" | awk -F= '{print $2}' | sort -u | wc -l

# Total Requests Per User
echo "Requests Per User:"
awk '{ for (i = 1; i <= NF; i++) if ($i ~ /user=/) print $i }' "$log_file" | awk -F= '{print $2}' | sort | uniq -c

# Total Successful Requests
echo "Total Successful Requests (Status Code 200):"
awk '{ for (i = 1; i <= NF; i++) if ($i ~ /200/) count++ } END { print count }' "$log_file"

# Total Failed Requests
echo "Total Failed Requests (Status Codes 404 and 403):"
awk '{ for (i = 1; i <= NF; i++) if ($i ~ /403|404/) count++ } END { print count }' "$log_file"

