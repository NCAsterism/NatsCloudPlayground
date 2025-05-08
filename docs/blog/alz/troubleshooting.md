# Azure Landing Zone Troubleshooting Guide

This guide addresses common issues encountered during Azure Landing Zone implementation and provides solutions to resolve them.

## Common Deployment Issues

### 1. Management Group Deployment Failures

**Symptoms:**
- Deployment fails with "Authorization Failed" errors
- Management groups not visible in the Azure portal

**Solutions:**
- Verify the user has the "Management Group Contributor" role at the tenant root
- Ensure the Azure AD tenant ID is correctly specified
- Allow up to 15 minutes for management group changes to propagate

```bash
# Check current user permissions
az role assignment list --scope "/" --query "[].{principalName:principalName, roleDefinitionName:roleDefinitionName}" -o table

# Assign required permissions if missing
az role assignment create --assignee "user@example.com" --role "Management Group Contributor" --scope "/"
```

### 2. Policy Assignment Failures

**Symptoms:**
- Policy deployments complete but policies aren't enforced
- Error: "The client does not have permission to perform action"

**Solutions:**
- Ensure the deployment identity has "Resource Policy Contributor" permissions
- Check that policy definitions exist before attempting assignments
- Validate parameter files for correct policy definition references

```bash
# List policy definitions to verify existence
az policy definition list --management-group "mg-platform" --query "[].name" -o table

# Check policy assignments
az policy assignment list --disable-scope-strict-match --query "[].{name:name, scope:scope}" -o table
```

### 3. Networking Deployment Issues

**Symptoms:**
- Hub or spoke network deployments fail
- Peering connections show as disconnected
- Unable to route traffic between networks

**Solutions:**
- Verify resource provider registration for "Microsoft.Network"
- Check subscription quota limits for virtual networks
- Ensure address spaces don't overlap between VNets

```bash
# Register Microsoft.Network provider if needed
az provider register --namespace Microsoft.Network

# Verify peering status
az network vnet peering list --resource-group "rg-hub-networking" --vnet-name "vnet-hub" -o table
```

### 4. Role Assignment Issues

**Symptoms:**
- Error: "The role assignment already exists"
- Role assignments not granting expected permissions

**Solutions:**
- Use the `--allow-no-operations` flag to prevent failures on duplicate assignments
- Clear Azure CLI token cache if permission changes aren't reflected
- Wait for role assignment propagation (can take up to 30 minutes)

```bash
# Clear token cache
az account clear
az login

# List existing role assignments
az role assignment list --assignee "user@example.com" --all -o table
```

## Environment-Specific Issues

### Azure Cloud Shell

If using Azure Cloud Shell for deployments:
- Storage account session timeouts: reconnect your session
- Limited storage: clear unnecessary files from Cloud Shell storage
- Slow operations: consider using a local terminal with Azure CLI

### Corporate Environments

Issues specific to enterprise networks:
- Proxy connectivity problems: configure Azure CLI proxy settings
- Firewall restrictions: ensure required endpoints are allowlisted
- Custom Azure AD settings: additional authentication steps may be required

## Diagnosing Deployment Failures

For any deployment:

```bash
# Get detailed error information
az deployment mg show --name "mgmt-groups-deployment" --management-group-id "mg-root" --query "properties.error" -o json

# Check activity logs for resource failures
az monitor activity-log list --correlation-id "your-correlation-id" -o table
```

## Getting Help

If you encounter issues not covered in this guide:
- Review the [ALZ-Bicep GitHub Issues](https://github.com/Azure/ALZ-Bicep/issues)
- Check the [Microsoft Learn documentation](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/)
- Post detailed questions on [Stack Overflow](https://stackoverflow.com/questions/tagged/azure) with the `azure` and `azure-landing-zone` tags

## Related Resources

- [Implementation Guide](./implementation/index.md)
- [Prerequisites](./prerequisites.md)
- [Planning Guide](./planning.md)
- [Implementation Tasks](./tasks.md) 