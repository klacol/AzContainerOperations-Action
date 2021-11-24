param (
    [Parameter(Mandatory = $false)]$containerName = $env:containerName,
    [Parameter(Mandatory = $false)]$command = $env:command,
    [Parameter(Mandatory = $false)]$tenant = $env:tenant,
    [Parameter(Mandatory = $false)]$resourceGroup = $env:resourceGroup,
    [Parameter(Mandatory = $false)]$username = $env:username,
    [Parameter(Mandatory = $false)]$password = $env:password
)
az login --service-principal -u $username -p $password --tenant $tenant
Write-Host "-----Logged In -----"

$command = $command.ToLower()
Write-Host "command:"$command
Write-Host "containerName:"$containerName

az container $command --name $containerName --resource-group $resourceGroup

Write-Host "Ok, done!"