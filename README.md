# Azure Container Instance Operations
## Description

A [Github Action](https://github.com/features/actions) to start, stop and restart containers in the Azure Container Instances (ACI) using the [az container command](https://docs.microsoft.com/de-de/cli/azure/container?view=azure-cli-latest).

## Inputs

| Parameter | Description | Required | Default |
| - | - | - | - |
| container-name | The name of the container, to which to commands shall be applied, eg. `my-container` | `true` | N/A |
| command | The name of the command to run. One of `start`, `stop` or `restart`.  | `true` | N/A |
| tenant | Azure Service Principal Tenant ID | `true` | N/A |
| resource-group | The name of the resource group of the container, e.g. `my.resource.group` | `true`  | N/A  |
| username | Azure Service Principal Username | `true` | N/A |
| password | Azure Service Principal Token | `true` | N/A |

## Example Usage

The following example shows how to configure each action. It is good practice to [store the credentials as encrypted secrets in GitHub](https://docs.github.com/en/actions/security-guides/encrypted-secrets). This applies in the example to the parameters for ```tenant```, ```username``` and ```password```.

To be able to reuse the parameters for ```resource-group``` and ```container-name``` in all three commands, they are created as environment variables.

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
        tenant: ${{ secrets.SERVICE_PRINCIPAL_TENANT }}
        resource-group: ${{ env.resource-group }}
        username: ${{ secrets.SERVICE_PRINCIPAL_USERNAME }}
        password: ${{ secrets.SERVICE_PRINCIPAL_TOKEN }}
    - name: Stop Container
      uses: klacol/AzContainerOperations-Action@v1
      with:
        container-name: ${{ env.container-name }}
        command: 'stop'
        resource-group: ${{ env.resource-group }}
        tenant: ${{ secrets.SERVICE_PRINCIPAL_TENANT }}
        username: ${{ secrets.SERVICE_PRINCIPAL_USERNAME }}
        password: ${{ secrets.SERVICE_PRINCIPAL_TOKEN }}
    - name: Restart Container
      uses: klacol/AzContainerOperations-Action@v1
      with:
        container-name: ${{ env.container-name }}
        command: 'restart'
        tenant: ${{ secrets.SERVICE_PRINCIPAL_TENANT }}
        resource-group: ${{ env.resource-group }}
        username: ${{ secrets.SERVICE_PRINCIPAL_USERNAME }}
        password: ${{ secrets.SERVICE_PRINCIPAL_TOKEN }}

```

## Runs

This action is a `docker` action.
