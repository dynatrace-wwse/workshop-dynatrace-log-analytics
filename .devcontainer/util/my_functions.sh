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

  # Check if DT_PLATFORM_URL environment variable is set
  _check_env_var DT_PLATFORM_URL

  # Check if DT_PLATFORM_TOKEN environment variable is set
  _check_env_var DT_PLATFORM_TOKEN

  # Make sure monaco is executable
  chmod +x $REPO_PATH/assets/dynatrace/config/monaco

  # Dry run monaco deployment
  ./$REPO_PATH/assets/dynatrace/config/monaco deploy --dry-run manifest.yaml

}

# helper function for checking if environment variable has been set
_check_env_var() {
  local var_name="$1"
  if [ -z "${!var_name}" ]; then
    printWarn "Environment variable '$var_name' is NOT set."
    return 1
  else
    printInfo "Environment variable '$var_name' is set to '${!var_name}'."
    return 0
  fi
}
