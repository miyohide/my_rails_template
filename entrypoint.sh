#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Azure Web Apps上で動かすための記述
rails db:prepare

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
