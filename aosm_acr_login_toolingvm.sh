#!/bin/bash
set -e

export auth_token=$(az account get-access-token | grep accessToken | sed 's#.*": "##g' | sed 's#",##g'  )

creds=$(curl -s -H "Content-Type: application/json" -H "Authorization: Bearer ${auth_token}" -H "Content-Length: 0" -X POST https://management.azure.com/subscriptions/291aba08-0b74-43b8-b543-678275bda3f7/resourceGroups/enea-rdmwa45-precert-rg-1/providers/Microsoft.Hybridnetwork/publishers/EneaPublisher1/artifactStores/EneaArtifactStore1/artifactManifests/EneaToolingVMManifest/listcredential?api-version=2023-04-01-preview )
user=$(echo $creds | jq -r .username)
pass=$(echo $creds | jq -r .acrToken)
registry=$(echo $creds | jq -r .acrServerUrl | sed "s#https://##g" )

echo ACR details are : 
echo ${creds} | jq -r

echo logging in .. 
set -x
docker login ${registry} --username ${user} --password "${pass}"

