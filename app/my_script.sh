#!/bin/sh

mount-s3 s3fstest-bucket101 /home/data

# Run your application using uvicorn
exec uvicorn app.main:app --host 0.0.0.0 --port 8080