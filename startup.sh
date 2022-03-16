#!/bin/bash

if [ -f /firstrun ]; then
systemctl status telegraph
systemctl start telegraph
systemctl status telegraph
fi

# Start supervisor to start the services
