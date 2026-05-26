#!/bin/bash
#loading functions to script
export SECONDS=0
source .devcontainer/util/source_framework.sh

setUpTerminal

startK3dCluster

installK9s

# Dynatrace Operator can be deployed automatically
#dynatraceDeployOperator

# You can deploy CNFS or AppOnly
#deployCloudNative
#deployApplicationMonitoring

deployAstroshop

finalizePostCreation

printInfoSection "Your dev container finished creating"
