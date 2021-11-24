# Azure Container Instance Operations
## Description

An action to start, stop and restart containers from the Azure Container Instances using the [az container command](https://docs.microsoft.com/de-de/cli/azure/container?view=azure-cli-latest).

## Inputs

| Parameter | Description | Required | Default |
| - | - | - | - |
| container-name | The name of the container, on which to commands shall be applied, eg. `my-container` | `true` | N/A |
| command | The name of the command to run. One of `start`, `stop` or `restart`.  | `true` | N/A |
| tenant | Azure Service Principal Tenant ID | `true` | N/A |
| resource-group | The name of the resource group of the container, e.g. `my.resource.group` | `true`  | N/A  |
| username | Azure Service Principal Username | `true` | N/A |
| password | Azure Service Principal Token | `true` | N/A |



## Example Usage

```yaml
name: Azure Container Instance Operations
on: 
    workflow_dispatch: 
    schedule:
       - cron: '0 06,18 * * *'
jobs:
  aci-command:
    runs-on: ubuntu-latest
    env:
        container-name: 'my-container' 
        resource-group: 'my.resource.group'
    steps:
    - name: Start Container
      uses: klacol/AzContainerOperations-Action@v1
      with:
        container-name: ${{ env.container-name }}
        command: 'start'
        tenant: ${{ secrets.SP_TENANT }}
        username: ${{ secrets.SP_USERNAME }}
        password: ${{ secrets.SERVICE_PRINCIPAL_TOKEN }}
        resource-group: ${{ env.resource-group }}
    - name: Stop Container
      uses: klacol/AzContainerOperations-Action@v1
      with:
        container-name: ${{ env.container-name }}
        command: 'stop'
        tenant: ${{ secrets.SP_TENANT }}
        username: ${{ secrets.SP_USERNAME }}
        password: ${{ secrets.SERVICE_PRINCIPAL_TOKEN }}
        resource-group: ${{ env.resource-group }}
    - name: Restart Container
      uses: klacol/AzContainerOperations-Action@v1
      with:
        container-name: ${{ env.container-name }}
        command: 'restart'
        tenant: ${{ secrets.SP_TENANT }}
        username: ${{ secrets.SP_USERNAME }}
        password: ${{ secrets.SERVICE_PRINCIPAL_TOKEN }}
        resource-group: ${{ env.resource-group }}

```

## Runs

This action is a `docker` action.
