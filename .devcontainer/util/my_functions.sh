#!/bin/bash
# ======================================================================
#          ------- Custom Functions -------                            #
#  Space for adding custom functions so each repo can customize as.    # 
#  needed.                                                             #
# ======================================================================

# deploy easytrade from manifests
deployEasyTrade() {

  printInfoSection "Deploying EasyTrade"

  # Create easytrade namespace
  printInfoSection "Creating 'easytrade' namespace"

  kubectl create namespace easytrade

  # Deploy easytrade manifests
  printInfoSection "Deploying easytrade manifests"

  kubectl apply -f $REPO_PATH/.devcontainer/apps/custom/easytrade/manifests -n easytrade

  # Validate pods are running
  printInfoSection "Waiting for all pods to start"

  waitForAllPods easytrade

  # TODO: Expose App
  #printInfo "Exposing Astroshop in your dev.container via NodePort 30100"

  #printInfo "Change astroshop-frontendproxy service from LoadBalancer to NodePort"
  #kubectl patch service astroshop-frontendproxy --namespace=astroshop --patch='{"spec": {"type": "NodePort"}}'

  #printInfo "Exposing the astroshop-frontendproxy in NodePort 30100"
  #kubectl patch service astroshop-frontendproxy --namespace=astroshop --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":30100}]'

  printInfo "EasyTrade deployed succesfully"

}

# deploy hipstershop from manifests
deployHipsterShop() {

  printInfoSection "Deploying HipsterShop"

  # Create hipstershop namespace
  printInfoSection "Creating 'hipstershop' namespace"

  kubectl create namespace hipstershop

  # Deploy hipstershop manifests
  printInfoSection "Deploying hipstershop manifests"

  kubectl apply -f $REPO_PATH/.devcontainer/apps/custom/hipstershop/manifests -n hipstershop

  # Validate pods are running
  printInfoSection "Waiting for all pods to start"

  waitForAllPods hipstershop

  # TODO: Expose App
  #printInfo "Exposing Astroshop in your dev.container via NodePort 30100"

  #printInfo "Change astroshop-frontendproxy service from LoadBalancer to NodePort"
  #kubectl patch service astroshop-frontendproxy --namespace=astroshop --patch='{"spec": {"type": "NodePort"}}'

  #printInfo "Exposing the astroshop-frontendproxy in NodePort 30100"
  #kubectl patch service astroshop-frontendproxy --namespace=astroshop --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":30100}]'

  printInfo "HipsterShop deployed succesfully"
  
}

# deploy dynatrace configurations (monaco)
deployDynatraceConfig() {

  printInfoSection "Deploying Dynatrace Configurations with Monaco"

  # Check if DT_PLATFORM_URL environment variable is set
  _check_env_var DT_PLATFORM_URL

  # Check if DT_PLATFORM_TOKEN environment variable is set
  _check_env_var DT_PLATFORM_TOKEN

  # Make sure monaco is executable
  chmod +x $REPO_PATH/assets/dynatrace/config/monaco

  # Copy monaco to local bin directory
  sudo cp $REPO_PATH/assets/dynatrace/config/monaco /usr/local/bin/

  printInfo "Monaco dry run deployment (monaco deploy --dry-run manifest.yaml)"

  # Dry run monaco deployment
  (cd $REPO_PATH/assets/dynatrace/config && monaco deploy --dry-run manifest.yaml)

  # Validate dry run
  dryrun=$(cd "$REPO_PATH/assets/dynatrace/config" && monaco deploy --dry-run manifest.yaml)

  if [[ "$dryrun" == *"Validation finished without errors"* ]]; then
    printInfo "✅ Validation passed."
  else
    printError "❌ Validation failed: 'Validation finished without errors' not found in output."
    return 1  # or exit 1 if you're in a script
  fi

  printInfo "Monaco deployment (monaco deploy manifest.yaml)"

  # Execute monaco deployment
  execute=$(cd "$REPO_PATH/assets/dynatrace/config" && monaco deploy manifest.yaml)

  echo $execute

  if [[ "$execute" == *"Deployment finished without errors"* ]]; then
    printInfo "✅ Deployment execution passed."
  else
    printError "❌ Deployment execution failed: 'Deployment finished without errors' not found in output."
    return 1  # or exit 1 if you're in a script
  fi

  printInfo "Successfully deployed Dynatrace Configurations with Monaco"

}

# delete dynatrace configurations (monaco)
deleteDynatraceConfig() {

  printInfoSection "Deleting Dynatrace Configurations with Monaco"

  # Check if DT_PLATFORM_URL environment variable is set
  _check_env_var DT_PLATFORM_URL

  # Check if DT_PLATFORM_TOKEN environment variable is set
  _check_env_var DT_PLATFORM_TOKEN

  # Make sure monaco is executable
  chmod +x $REPO_PATH/assets/dynatrace/config/monaco

  # Copy monaco to local bin directory
  sudo cp $REPO_PATH/assets/dynatrace/config/monaco /usr/local/bin/

  printInfo "Generating Monaco deletefile (monaco generate deletefile manifest.yaml)"

  # Generate deletefile from projects
  (cd $REPO_PATH/assets/dynatrace/config && monaco generate deletefile manifest.yaml)

  printInfo "Deleting Configurations in Monaco deletefile"

  # Delete configurations in deletefile
  (cd $REPO_PATH/assets/dynatrace/config && monaco delete -m manifest.yaml)

  # Validate deletion
  deletion=$(cd "$REPO_PATH/assets/dynatrace/config" && monaco delete -m manifest.yaml)

  if [[ "$deletion" == *"Deleting configs..."* ]]; then
    printInfo "✅ Validation passed."
  else
    printError "❌ Validation failed: 'Deleting configs...' not found in output."
    return 1  # or exit 1 if you're in a script
  fi

}

# helper function for checking if environment variable has been set (zsh)
_check_env_var() {
  local var_name="$1"
  eval "var_value=\${$var_name}"
  if [[ -z "$var_value" ]]; then
    printWarn "Environment variable '$var_name' is NOT set."
    return 1
  else
    printInfo "Environment variable '$var_name' is set to '$var_value'."
    return 0
  fi
}