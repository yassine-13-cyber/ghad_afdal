#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Run migrations
python manage.py migrate

# Load data from datadump.json if it exists
if [ -f datadump.json ]; then
    echo "Loading data from datadump.json..."
    python manage.py loaddata datadump.json || echo "Data already loaded or error occurred"
fi