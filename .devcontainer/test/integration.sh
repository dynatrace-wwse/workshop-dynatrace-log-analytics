#!/bin/bash
# Load framework
source .devcontainer/util/source_framework.sh

printInfoSection "Running integration Tests for $RepositoryName"

assertRunningPod astroshop frontend

assertRunningApp 30100
