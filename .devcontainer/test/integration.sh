#!/bin/bash
# Load framework
source .devcontainer/util/source_framework.sh

# Load tests
source $REPO_PATH/.devcontainer/test/test_functions.sh

printInfoSection "Running integration Tests for the Enablement Framework"

assertRunningPod todoapp todoapp

assertRunningApp 30100
