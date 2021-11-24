#!/usr/bin/env sh
set -e # Abort at first error
echo "Running \"pwsh /aci-command.ps1 -containerName "$1" -command "$2" -tenant "$3" -resourceGroup "$4" -username "$5" -password "$6""
pwsh /aci-command.ps1 -containerName "$1" -command "$2" -tenant "$3" -resourceGroup "$4" -username "$5" -password "$6"