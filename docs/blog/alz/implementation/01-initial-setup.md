# Initial Setup Guide for Azure Landing Zone Implementation

This guide walks through the initial setup process required before you can begin deploying the Azure Landing Zone components.

## Prerequisites

Before starting the implementation, ensure you have the following:

- **Azure Subscription** with Owner permissions
- **Azure CLI** (version 2.37.0 or later)
- **Bicep CLI** (version 0.9.0 or later)
- **Git** for source control
- **Visual Studio Code** with Bicep extension

## Step 1: Clone the Repository

```bash
# Clone the ALZ-Bicep repository
git clone https://github.com/Azure/ALZ-Bicep.git

# Navigate to the repository
cd ALZ-Bicep
```

## Step 2: Set Up Azure Authentication

```bash
# Login to Azure
az login

# Set the active subscription
az account set --subscription "Your-Subscription-Id"

# Verify the current context
az account show
```

## Step 3: Install Required Extensions

```bash
# Install or update Azure CLI extensions
az extension add --name account --upgrade
az extension add --name resource-graph --upgrade
```

## Step 4: Verify Bicep Installation

```bash
# Check Bicep version
bicep --version

# Update Bicep if needed
az bicep upgrade
```

## Step 5: Prepare Deployment Parameters

Create parameter files for each module you'll deploy. Start with the management group module:

```bash
# Copy the example parameter file
cp infra-as-code/bicep/modules/managementGroups/parameters/managementGroups.parameters.example.json \
   infra-as-code/bicep/modules/managementGroups/parameters/managementGroups.parameters.json

# Edit the parameter file with your values
code infra-as-code/bicep/modules/managementGroups/parameters/managementGroups.parameters.json
```

## Step 6: Configure Visual Studio Code

Recommended extensions for this implementation:

- Bicep extension by Microsoft
- Azure Resource Manager Tools
- Azure Account
- GitHub Pull Requests and Issues

## Step 7: Set Up Local Environment Variables

Create a .env file to store configuration values:

```bash
# Example .env file structure
TENANT_ID="your-tenant-id"
SUBSCRIPTION_ID="your-subscription-id"
LOCATION="eastus"
```

## Next Steps

Proceed to implementing the [Management Group Hierarchy](./02-management-groups.md) once this initial setup is complete.

## Troubleshooting

Common setup issues:

- **Authentication Errors**: Ensure you have the correct permissions in Azure AD
- **Bicep Installation Issues**: Reinstall Bicep using the latest installer
- **Git Clone Errors**: Check network connectivity and repository access

[← Back to Implementation Guide](./index.md) 