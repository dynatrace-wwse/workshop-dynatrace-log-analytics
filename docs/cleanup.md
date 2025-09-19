# Cleanup
--8<-- "snippets/send-bizevent/cleanup.js"

<!-- TODO:Cleanup steps -->

## Delete Dynatrace Configurations with Monaco

You can choose to keep the Dynatrace configurations, including the Notebooks and Dashboards, but if you want to delete them automatically you can leverage the helper function.

Start by setting your environment variables for Monaco, these will allow Monaco to authenticate with the Dynatrace Platform Services API.

```sh
export DT_PLATFORM_URL=https://{your-environment-id}.apps.dynatrace.com
export DT_PLATFORM_TOKEN=dt0sXX.ABC123XYZ
```

Delete the Dynatrace configurations with Monaco using the provided helper function.

```sh
deleteDynatraceConfig
```

## Delete Codespace

!!! tip "Deleting the codespace from inside the container"
    We like to make your life easier, for convenience there is a function loaded in the shell of the Codespace for deleting the codespace, just type `deleteCodespace`. This will trigger the deletion of the codespace.

Another way to do this is by going to [https://github.com/codespaces](https://github.com/codespaces){target=_blank} and delete the codespace.

## Delete Dynatrace Tokens

You may also want to deactivate or delete the API and Platform token(s) needed for this lab.