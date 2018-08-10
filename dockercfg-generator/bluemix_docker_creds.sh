#!/bin/bash

set -e

: "${BLUEMIX_API_KEY:?Need to set your BLUEMIX_API_KEY}"
: "${BLUEMIX_API_ENDPOINT:=api.ng.bluemix.net}"

# Logging into IBM Bluemix
echo "Logging into IBM Bluemix"
yes n | bluemix login --apikey "${BLUEMIX_API_KEY}" -a "${BLUEMIX_API_ENDPOINT}"
yes n | bluemix cs init
yes n | bluemix cr login

# writing aws docker creds to desired path
echo "Writing Docker creds to $1"
chmod 544 ~/.docker/config.json
cp ~/.docker/config.json $1
