
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Creates a new workspace.
.Description
Creates a new workspace.
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.Databricks.Models.Api20220401Preview.IWorkspace
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

AUTHORIZATION <IWorkspaceProviderAuthorization[]>: The workspace provider authorizations.
  PrincipalId <String>: The provider's principal identifier. This is the identity that the provider will use to call ARM to manage the workspace resources.
  RoleDefinitionId <String>: The provider's role definition identifier. This role will define all the permissions that the provider must have on the workspace's container resource group. This role definition cannot have permission to delete the resource group.
.Link
https://docs.microsoft.com/powershell/module/az.databricks/new-azdatabricksworkspace
#>
function New-AzDatabricksWorkspace {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.Databricks.Models.Api20220401Preview.IWorkspace])]
[CmdletBinding(DefaultParameterSetName='CreateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Alias('WorkspaceName')]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Path')]
    [System.String]
    # The name of the workspace.
    ${Name},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Path')]
    [System.String]
    # The name of the resource group.
    # The name is case insensitive.
    ${ResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # The ID of the target subscription.
    ${SubscriptionId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The geo-location where the resource lives
    ${Location},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The managed resource group Id.
    ${ManagedResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${AmlWorkspaceId},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.Management.Automation.SwitchParameter]
    # Should the Public IP be Disabled?
    ${EnableNoPublicIP},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The name of KeyVault key.
    ${EncryptionKeyName},

    [Parameter()]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Databricks.Support.KeySource])]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Support.KeySource]
    # The encryption keySource (provider).
    # Possible values (case-insensitive): Default, Microsoft.Keyvault
    ${EncryptionKeySource},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The Uri of KeyVault.
    ${EncryptionKeyVaultUri},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The version of KeyVault key.
    ${EncryptionKeyVersion},
    
    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${LoadBalancerBackendPoolName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${LoadBalancerId},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${NatGatewayName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.Management.Automation.SwitchParameter]
    # The value which should be used for this field.
    ${PrepareEncryption},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${PrivateSubnetName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${PublicIPName},

    [Parameter()]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Databricks.Support.PublicNetworkAccess])]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Support.PublicNetworkAccess]
    # The network access type for accessing workspace.
    # Set value to disabled to access workspace only via private link.
    ${PublicNetworkAccess},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${PublicSubnetName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.Management.Automation.SwitchParameter]
    # The value which should be used for this field.
    ${RequireInfrastructureEncryption},

    [Parameter()]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Databricks.Support.RequiredNsgRules])]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Support.RequiredNsgRules]
    # Gets or sets a value indicating whether data plane (clusters) to control plane communication happen over private endpoint.
    # Supported values are 'AllRules' and 'NoAzureDatabricksRules'.
    # 'NoAzureServiceRules' value is for internal use only.
    ${RequiredNsgRule},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The SKU name.
    ${Sku},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The SKU tier.
    ${SkuTier},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${StorageAccountName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${StorageAccountSku},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.Databricks.Models.Api20220401Preview.ITrackedResourceTags]))]
    [System.Collections.Hashtable]
    # Resource tags.
    ${Tag},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${VirtualNetworkId},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Body')]
    [System.String]
    # The value which should be used for this field.
    ${VnetAddressPrefix},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command as a job
    ${AsJob},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command asynchronously
    ${NoWait},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Databricks.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

    process {
        try {
            if (-not $PSBoundParameters.ContainsKey('ManagedResourceGroupName')) {
                $randomStr = -join ((48..57) + (97..122) | Get-Random -Count 13 | % { [char]$_ })
                $manageResourceGroupName = "databricks-rg-{0}-{1}" -f $PSBoundParameters["Name"], $randomStr
            }
            else {
                $manageResourceGroupName = $PSBoundParameters["ManagedResourceGroupName"]
                $null = $PSBoundParameters.Remove("ManagedResourceGroupName")
            }
            $ManagedResourceGroupId = "/subscriptions/{0}/resourceGroups/{1}" -f (Get-AzContext).Subscription.Id, $manageResourceGroupName
            $null = $PSBoundParameters.Add("ManagedResourceGroupId", $ManagedResourceGroupId)
            Az.Databricks.internal\New-AzDatabricksWorkspace @PSBoundParameters
        }
        catch {
            throw
        }
    }
}
# SIG # Begin signature block
# MIInoAYJKoZIhvcNAQcCoIInkTCCJ40CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBZuWMAMWc4xY9J
# l9u8ZgIJWBp+743m+TBR1q3YQpCUMaCCDYEwggX/MIID56ADAgECAhMzAAACzI61
# lqa90clOAAAAAALMMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjIwNTEyMjA0NjAxWhcNMjMwNTExMjA0NjAxWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCiTbHs68bADvNud97NzcdP0zh0mRr4VpDv68KobjQFybVAuVgiINf9aG2zQtWK
# No6+2X2Ix65KGcBXuZyEi0oBUAAGnIe5O5q/Y0Ij0WwDyMWaVad2Te4r1Eic3HWH
# UfiiNjF0ETHKg3qa7DCyUqwsR9q5SaXuHlYCwM+m59Nl3jKnYnKLLfzhl13wImV9
# DF8N76ANkRyK6BYoc9I6hHF2MCTQYWbQ4fXgzKhgzj4zeabWgfu+ZJCiFLkogvc0
# RVb0x3DtyxMbl/3e45Eu+sn/x6EVwbJZVvtQYcmdGF1yAYht+JnNmWwAxL8MgHMz
# xEcoY1Q1JtstiY3+u3ulGMvhAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUiLhHjTKWzIqVIp+sM2rOHH11rfQw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDcwNTI5MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAeA8D
# sOAHS53MTIHYu8bbXrO6yQtRD6JfyMWeXaLu3Nc8PDnFc1efYq/F3MGx/aiwNbcs
# J2MU7BKNWTP5JQVBA2GNIeR3mScXqnOsv1XqXPvZeISDVWLaBQzceItdIwgo6B13
# vxlkkSYMvB0Dr3Yw7/W9U4Wk5K/RDOnIGvmKqKi3AwyxlV1mpefy729FKaWT7edB
# d3I4+hldMY8sdfDPjWRtJzjMjXZs41OUOwtHccPazjjC7KndzvZHx/0VWL8n0NT/
# 404vftnXKifMZkS4p2sB3oK+6kCcsyWsgS/3eYGw1Fe4MOnin1RhgrW1rHPODJTG
# AUOmW4wc3Q6KKr2zve7sMDZe9tfylonPwhk971rX8qGw6LkrGFv31IJeJSe/aUbG
# dUDPkbrABbVvPElgoj5eP3REqx5jdfkQw7tOdWkhn0jDUh2uQen9Atj3RkJyHuR0
# GUsJVMWFJdkIO/gFwzoOGlHNsmxvpANV86/1qgb1oZXdrURpzJp53MsDaBY/pxOc
# J0Cvg6uWs3kQWgKk5aBzvsX95BzdItHTpVMtVPW4q41XEvbFmUP1n6oL5rdNdrTM
# j/HXMRk1KCksax1Vxo3qv+13cCsZAaQNaIAvt5LvkshZkDZIP//0Hnq7NnWeYR3z
# 4oFiw9N2n3bb9baQWuWPswG0Dq9YT9kb+Cs4qIIwggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIZdTCCGXECAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAsyOtZamvdHJTgAAAAACzDAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgsKz0KLas
# mvMiGVegCYCD65VMizN3EzFphTm4qCJkuIgwQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQAJdWkULjJ/o7zJEANFP1MyIbIC+jV2OLvPfXIR9gv2
# Dm6gjPkRZRP6oqDzEqWGMzh6GFO5pZs6BEwI45VgdSbQ0PAydqVbGxpx8CDcc/Tc
# /MGFJTBI+3LIv6WSTpEo6X+EDi63zDdbFhHR9tkoAukGzWnuY+IZBIx2GkOKQZVY
# a8fJxCnDeuvizw66IksbTpzkycsU9bGKhWH1vXLm720glRrYBZbO2s9IvdB7V9O0
# e3OHeCP86h+YDcorjmTMt0CgOdpCoaZVAaLHWphbQvS1IljgB9lspihBkwpKgeWl
# z/6I8XsoSlfnAUqlwHw9gXxL7Llm+RF3sBgSHFGrr5ZPoYIW/zCCFvsGCisGAQQB
# gjcDAwExghbrMIIW5wYJKoZIhvcNAQcCoIIW2DCCFtQCAQMxDzANBglghkgBZQME
# AgEFADCCAVAGCyqGSIb3DQEJEAEEoIIBPwSCATswggE3AgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEIHIn0ye2VdVKM9dAI2zjWkZCDRqx+3Cdbpre7rqQ
# MAkEAgZjIxZzWp4YEjIwMjIxMDEwMDYxOTU5LjI0WjAEgAIB9KCB0KSBzTCByjEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWlj
# cm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBF
# U046RDZCRC1FM0U3LTE2ODUxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFNlcnZpY2WgghFXMIIHDDCCBPSgAwIBAgITMwAAAZ79wi3YMVq2sQABAAABnjAN
# BgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
# bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
# aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0y
# MTEyMDIxOTA1MjBaFw0yMzAyMjgxOTA1MjBaMIHKMQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBP
# cGVyYXRpb25zMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjpENkJELUUzRTctMTY4
# NTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCAiIwDQYJ
# KoZIhvcNAQEBBQADggIPADCCAgoCggIBAO7pXKVIdcPwNrxeRU0ioODBalOuEvld
# cFrDZnN6ubayvFX42kv9m/ulUBI79MMaEAQxzBlPHJqO3wji9ngOecX1MPi0/oQT
# lDHUtBChkCOrnlQf2qqlzWfBEk0GVCL5Z0BXsiIaNAF7wn5ZhXfK8OqURgULlUx7
# w6wHvI4ykWsAhmrcOE+lMskzUtF00RUC0YWUtPkFsHDcUboSB9C3oOJ8Fi2xmq6E
# 8BoRH08gAsVDEDXfz6KE1FkkwlQyFdhoBLqgtE3qlhkMOhfLiqpwYZ4g2xEFFn3V
# M3qVCBp3wKdr6ofS0NCxBIlB+/vicl2DOQim/P8Oe9QU1n2+qaHY7E2fzalficu7
# MBkI/j7OYUZg8CWjrJydNz1jxc27xdUli+ejy5hiKBF1GbYBgh/DTgNgWFRET2GR
# yQoiHGOoRE1HEDRl4dNQcDm3plLfFM4k5aB4Hlbc9GG4BDKEhOMZpRBQCBLJfMPO
# s5qQ1NVuOPv5fw4awW1Hw5g/MF7uXfVIu+5006rxLGHZUD5agaZ3OF/5bsmYgQYC
# 2j//27wdS2eg3Mkr93BLYxi5yeKaU6vEpWuer2O/WGmCYc+htYeecuECBecfhKNp
# vI+QXUJl3wjYMsLnojjB5alyu2n5N2Gm/AEW9aLqidOzW5IWDhQECi05UmN1c0r7
# TUlVkXufGzVxAgMBAAGjggE2MIIBMjAdBgNVHQ4EFgQUaNM+g9F1jpc+1CRJOuiH
# 2WRlu60wHwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYDVR0fBFgw
# VjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWlj
# cm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwGCCsGAQUF
# BwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgx
# KS5jcnQwDAYDVR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkqhkiG
# 9w0BAQsFAAOCAgEAVLlVjqGZzwYfYPXy/5JNAD4D6BPV24TfK42fWYfjVMuq7NU0
# tbTcDMC+65xh5rVVqK1ETlRhsjPFSxX0byxOtdt2JzN5Ubroiku6WWHgjGp+f7HM
# Zs85lZRPrAC2BercV8wZj2Tveqj8hDmyGhOh4yEGYctZ6Dnf60Fy7xLOhxIclOJ5
# Zy/kqacC2gmtrlKYN1l0UELPRw/chSriR503RDYqEqswNEB4P8ILNrYNfwGP21F4
# /JxOe9+xJwJzlWzEM0Jqeery1Un4dBrNFUrwA1bZQwOBXreLtIoZvf6yUoj9j3ai
# 4ytMWFqLqHisKiPNKxC0lBMJycjRBMOh7G3OZouya0q7eMXYDKHyAV534pEOIOG0
# 1zJmgmb5+apoqFMiL2C4+h53vC+fnN173dmvpFcFO1cvR2VHQUzD/A9BUmMtURoS
# dhacpkf2VTxdklX7E6ZYUEVmR35GdU5bdlbl4Eawt67MMIBqau7Ki3Dg8PfpPp5g
# Ym/li+tfWJFgAOvFcJRiJ2tkljazQhVkWJyoaCnkW1hicAykTu3K4iPajjL6iXVv
# LeVBXo5vQ/hGcrqCe4QJYF+ZZKN685+v7TaaSx5byhEQcCb3L1d9x1RxDnu9ttq7
# z4BCJrzAZBw1enECegsPAn5EDJwOWl7d7ZiFr2de5jNxUyT3av9sojR/IY4wggdx
# MIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGI
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylN
# aWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5
# MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciEL
# eaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa
# 4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxR
# MTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEByd
# Uv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi9
# 47SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJi
# ss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+
# /NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY
# 7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtco
# dgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH
# 29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94
# q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcV
# AQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0G
# A1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQB
# gjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgw
# GQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB
# /wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0f
# BE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJv
# ZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4w
# TDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0
# cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIB
# AJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRs
# fNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6
# Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveV
# tihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKB
# GUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoy
# GtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQE
# cb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFU
# a2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+
# k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0
# +CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cir
# Ooo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYICzjCCAjcCAQEwgfih
# gdCkgc0wgcoxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAj
# BgNVBAsTHE1pY3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRo
# YWxlcyBUU1MgRVNOOkQ2QkQtRTNFNy0xNjg1MSUwIwYDVQQDExxNaWNyb3NvZnQg
# VGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQACFcI5kFsPED8HlN6L
# pF/zQv0aF6CBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0G
# CSqGSIb3DQEBBQUAAgUA5u3gqzAiGA8yMDIyMTAxMDA4MDcwN1oYDzIwMjIxMDEx
# MDgwNzA3WjB3MD0GCisGAQQBhFkKBAExLzAtMAoCBQDm7eCrAgEAMAoCAQACAgks
# AgH/MAcCAQACAhHBMAoCBQDm7zIrAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisG
# AQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQAD
# gYEAdzacZ/hX5GLmsl6bHs7R9M7MfbwGspNSnFbrH3jWAneJjHSCdOwFHbDWG7M+
# 8xGV+Yu8KPixO8SI6g/yFRER8AZMbFvqzT6g4vs1PcV2io9MCQ5UbMT5YLwJ0KoF
# 8TnbmTdqdCJygt75MRXIMDmDPK7CGpvMU17BLmSABUuGtQoxggQNMIIECQIBATCB
# kzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAZ79wi3YMVq2sQAB
# AAABnjANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJ
# EAEEMC8GCSqGSIb3DQEJBDEiBCDQ7v3ssCNMs936ZLeMN+MWDW0COHvCOODR+cf1
# 5GuhtjCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIA7FVjIi/lyPT6lmQm6s
# n7IKurRF7leCuR9K1Q79bzwZMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# UENBIDIwMTACEzMAAAGe/cIt2DFatrEAAQAAAZ4wIgQgCYGJq9J3UfWZzmYNLRdE
# xjyoMwvw5MILrM6GWTrULBIwDQYJKoZIhvcNAQELBQAEggIAtg3gfBUtAE8MH1cb
# gOfT0e/5wbykuO6/ouCxDC0/zn6BW4yGRc8S/QU5PNF8eJvdIqV9HW9S11ClqTz+
# 2eHQxtOrAEi7a6OLOwNpXuu0e9Mfqf3AC1A6uMMWaD+9DhcFT4/ce8OFDUU9/3F9
# OGQwPBqtdlIpRGdOJQFK5tQ9tbVtBqFCNDijLsW7x9eT55g7s5QGTbctPCWwFNxw
# XXCAsNgQzwMMLCPeVKxX49128Ft462S12IMVWWlBMDEfNRGRgu+E0LzVOBmYsNMm
# qDUWbT1N1U+GQZIQTyVJQMgEJv2d1O4ctn2STQ42x059LShvM1OShaJTghSdT1X+
# cB0jmA7S6RkeHAr7GS402J+z66jGgQuAA07Vf/pbohN5HvAWQ9KnZ2eDdTFNIbpF
# 26ZCnfK/bH5hSV5lL3Nzn30bPLGVzXzbUU15lKAxTVGE11GmEumD1fSjkPtSskGr
# K9ezUIUpo8hLVEj12m0OJN2r9l3ya3tiFvQJ1l0xWTsoTpPEc5Txh1p22ig1+DgG
# 5F+YlShBUwriYs4B1uSet+0JaEh+BFWGwjVnkMHheAbsTZUhghFTUrSZO9q/SUD0
# 53Q4kTyKp1fjSlNsIyO6or1C4qqZgfPVYAqgGDaxMzUbdl57e9Mu+PdPW3ECrfcL
# m7P87ER66sUZ/TR8Gqe3h4MGP5Q=
# SIG # End signature block