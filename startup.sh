#!/bin/bash

if [ -f /firstrun ]; then
systemctl start telegraph
fi

# Start supervisor to start the services
