#!/bin/bash

set -e

# login to IBM Bluemix via credentials provided via (encrypted) environment
# variables
yes n | bluemix login \
  --apikey "${BLUEMIX_API_KEY}" \
  -a "${BLUEMIX_API_ENDPOINT}" \
  -o "${BLUEMIX_ORGANIZATION}" \
  -s "${BLUEMIX_SPACE}"

# check that the CloudFoundry CLI is available via the Bluemix CLI wrapper
yes n | bluemix cf version

# list available CloudFoundry applications
yes n | bluemix cf apps

# push the application
#bluemix cf push
