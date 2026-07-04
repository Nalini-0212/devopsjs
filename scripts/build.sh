#!/bin/bash
set -e
docker build -t react-app:latest -f docker/Dockerfile .