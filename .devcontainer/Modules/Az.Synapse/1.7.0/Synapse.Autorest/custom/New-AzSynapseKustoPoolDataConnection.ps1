
# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Creates or updates a data connection.
.Description
Creates or updates a data connection.
.Example
PS C:\> New-AzSynapseKustoPoolDataConnection -ResourceGroupName testrg -WorkspaceName testws -KustoPoolName testkustopool -DatabaseName testdatabase -Name eventhubdc -Location eastus2 -Kind EventHub -EventHubResourceId "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/testrg/providers/Microsoft.EventHub/namespaces/testeventhubns/eventhubs/testeventhub" -DataFormat "JSON" -ConsumerGroup '$Default' -Compression "None" -TableName "Events" -MappingRuleName "EventsMapping"

Kind     Location  Name                                            
----     --------  ----                                            
EventHub East US 2 testws/testkustopool/testdatabase/eventhubdc
.Example
PS C:\> New-AzSynapseKustoPoolDataConnection -ResourceGroupName testrg -WorkspaceName testws -KustoPoolName testkustopool -DatabaseName testdatabase -Name eventgriddc -Location eastus2 -Kind EventGrid -EventHubResourceId "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/testrg/providers/Microsoft.EventHub/namespaces/testeventhubns/eventhubs/testeventhub" -StorageAccountResourceId "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/testrg/providers/Microsoft.Storage/storageAccounts/teststorage" -DataFormat "JSON" -ConsumerGroup '$Default' -TableName "Events" -MappingRuleName "EventsMapping" -IgnoreFirstRecord -BlobStorageEventType "Microsoft.Storage.BlobRenamed"

Kind      Location  Name
----      --------  ----                                              
EventGrid East US 2 testws/testkustopool/testdatabase/eventgriddc
.Example
PS C:\> New-AzSynapseKustoPoolDataConnection -ResourceGroupName testrg -WorkspaceName testws -KustoPoolName testkustopool -DatabaseName testdatabase -Name iothubdc -Location eastus2 -Kind IotHub -IotHubResourceId "/subscriptions/051ddeca-1ed6-4d8b-ba6f-1ff561e5f3b3/resourceGroups/ywtest/providers/Microsoft.Devices/IotHubs/ywtestiothub" -SharedAccessPolicyName registryRead -DataFormat "JSON" -ConsumerGroup '$Default' -TableName "Events" -MappingRuleName "EventsMapping"

Kind   Location  Name 
----   --------  ----                                           
IotHub East US 2 testws/testkustopool/testdatabase/iothubdc

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.IDataConnection
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.IDataConnection
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

PARAMETER <IDataConnection>: Class representing a data connection.
  Kind <DataConnectionKind>: Kind of the endpoint for the data connection
  [Location <String>]: Resource location.
  [SystemDataCreatedAt <DateTime?>]: The timestamp of resource creation (UTC).
  [SystemDataCreatedBy <String>]: The identity that created the resource.
  [SystemDataCreatedByType <CreatedByType?>]: The type of identity that created the resource.
  [SystemDataLastModifiedAt <DateTime?>]: The timestamp of resource last modification (UTC)
  [SystemDataLastModifiedBy <String>]: The identity that last modified the resource.
  [SystemDataLastModifiedByType <CreatedByType?>]: The type of identity that last modified the resource.
.Link
https://docs.microsoft.com/powershell/module/az.synapse/new-azsynapsekustopooldataconnection
#>
function New-AzSynapseKustoPoolDataConnection {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.IDataConnection])]
    [CmdletBinding(DefaultParameterSetName='CreateExpandedEventHub', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory)]
        [Alias('Name')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the data connection.
        ${DataConnectionName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the database in the Kusto pool.
        ${DatabaseName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the Kusto pool.
        ${KustoPoolName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the resource group.
        # The name is case insensitive.
        ${ResourceGroupName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [System.String]
        # The name of the workspace
        ${WorkspaceName},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # The ID of the target subscription.
        ${SubscriptionId},

        [Parameter(Mandatory)]
        [ArgumentCompleter({ param ( $CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters ) return @('EventHub', 'EventGrid', 'IotHub') })]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.DataConnectionKind]
        # Kind of the endpoint for the data connection
        ${Kind},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub', Mandatory)]
        [Parameter(ParameterSetName = 'CreateExpandedEventGrid', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # The resource ID of the event hub to be used to create a data connection / event grid is configured to send events.
        ${EventHubResourceId},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # The event/iot hub consumer group.
        ${ConsumerGroup},

        [Parameter(ParameterSetName = 'UpdateExpandedEventGrid')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityExpandedEventGrid')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.BlobStorageEventType]
        # The name of blob storage event type to process.
        ${BlobStorageEventType},

        [Parameter(ParameterSetName = 'UpdateExpandedEventGrid')]
        [Parameter(ParameterSetName = 'UpdateViaIdentityExpandedEventGrid')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # If set to true, indicates that ingestion should ignore the first record of every file.
        ${IgnoreFirstRecord},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.EventGridDataFormat]
        # The data format of the message. Optionally the data format can be added to each message.
        ${DataFormat},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Parameter(ParameterSetName = 'CreateExpandedIotHub')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String[]]
        # System properties of the event/iot hub.
        ${EventSystemProperty},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # The mapping rule to be used to ingest the data. Optionally the mapping information can be added to each message.
        ${MappingRuleName},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # The table where the data should be ingested. Optionally the table information can be added to each message.
        ${TableName},

        [Parameter(ParameterSetName = 'CreateExpandedEventHub')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Support.Compression]
        # The event hub messages compression type.
        ${Compression},

        [Parameter(ParameterSetName = 'CreateExpandedEventGrid', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # The resource ID of the storage account where the data resides.
        ${StorageAccountResourceId},

        [Parameter(ParameterSetName = 'CreateExpandedIotHub', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # The resource ID of the Iot hub to be used to create a data connection.
        ${IotHubResourceId},

        [Parameter(ParameterSetName = 'CreateExpandedIotHub', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # The name of the share access policy.
        ${SharedAccessPolicyName},

        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Body')]
        [System.String]
        # Resource location.
        ${Location},

        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        try {
            if ($PSBoundParameters['Kind'] -eq 'EventHub') {
                $Parameter = [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.EventHubDataConnection]::new()
                
                $Parameter.EventHubResourceId = $PSBoundParameters['EventHubResourceId']            
                $null = $PSBoundParameters.Remove('EventHubResourceId')

                if ($PSBoundParameters.ContainsKey('EventSystemProperty')) {
                    $Parameter.EventSystemProperty = $PSBoundParameters['EventSystemProperty']
                    $null = $PSBoundParameters.Remove('EventSystemProperty')
                }

                if ($PSBoundParameters.ContainsKey('Compression')) {
                    $Parameter.Compression = $PSBoundParameters['Compression']
                    $null = $PSBoundParameters.Remove('Compression')
                }
            }
            elseif ($PSBoundParameters['Kind'] -eq 'EventGrid') {
                $Parameter = [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.EventGridDataConnection]::new()
            
                $Parameter.EventHubResourceId = $PSBoundParameters['EventHubResourceId']
                $null = $PSBoundParameters.Remove('EventHubResourceId')

                $Parameter.StorageAccountResourceId = $PSBoundParameters['StorageAccountResourceId']
                $null = $PSBoundParameters.Remove('StorageAccountResourceId')

                if ($PSBoundParameters.ContainsKey('BlobStorageEventType')) {
                    $Parameter.BlobStorageEventType = $PSBoundParameters['BlobStorageEventType']
                    $null = $PSBoundParameters.Remove('BlobStorageEventType')
                }

                if ($PSBoundParameters.ContainsKey('IgnoreFirstRecord')) {
                    $Parameter.IgnoreFirstRecord = $PSBoundParameters['IgnoreFirstRecord']
                    $null = $PSBoundParameters.Remove('IgnoreFirstRecord')
                }
            }
            else {
                $Parameter = [Microsoft.Azure.PowerShell.Cmdlets.Synapse.Models.Api20210601Preview.IotHubDataConnection]::new()

                $Parameter.IotHubResourceId = $PSBoundParameters['IotHubResourceId']
                $null = $PSBoundParameters.Remove('IotHubResourceId')

                $Parameter.SharedAccessPolicyName = $PSBoundParameters['SharedAccessPolicyName']
                $null = $PSBoundParameters.Remove('SharedAccessPolicyName')

                if ($PSBoundParameters.ContainsKey('EventSystemProperty')) {
                    $Parameter.EventSystemProperty = $PSBoundParameters['EventSystemProperty']
                    $null = $PSBoundParameters.Remove('EventSystemProperty')
                }
            }

            $Parameter.Kind = $PSBoundParameters['Kind']
            $null = $PSBoundParameters.Remove('Kind')

            $Parameter.Location = $PSBoundParameters['Location']
            $null = $PSBoundParameters.Remove('Location')

            $Parameter.ConsumerGroup = $PSBoundParameters['ConsumerGroup']            
            $null = $PSBoundParameters.Remove('ConsumerGroup')

            if ($PSBoundParameters.ContainsKey('DataFormat')) {
                $Parameter.DataFormat = $PSBoundParameters['DataFormat']
                $null = $PSBoundParameters.Remove('DataFormat')
            }

            if ($PSBoundParameters.ContainsKey('MappingRuleName')) {
                $Parameter.MappingRuleName = $PSBoundParameters['MappingRuleName']
                $null = $PSBoundParameters.Remove('MappingRuleName')
            }

            if ($PSBoundParameters.ContainsKey('TableName')) {
                $Parameter.TableName = $PSBoundParameters['TableName']
                $null = $PSBoundParameters.Remove('TableName')
            }            

            $null = $PSBoundParameters.Add('Parameter', $Parameter)

            Az.Synapse.internal\New-AzSynapseKustoPoolDataConnection @PSBoundParameters
        }
        catch {
            throw
        }
    }
}

# SIG # Begin signature block
# MIInoQYJKoZIhvcNAQcCoIInkjCCJ44CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAcwBmkezPwa3L7
# axdWBvkJjmsMy1q8JCCuucn95qkrUqCCDYEwggX/MIID56ADAgECAhMzAAACzI61
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
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIZdjCCGXICAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAsyOtZamvdHJTgAAAAACzDAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQggQ/Tkrx/
# FAXfVqeIh+4OBKxhVWhQEQxq9uvPLb0PK6IwQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQAkPJmysKoew3uxxIl/ZbvDtMxtsc5BLZeko/zLgig9
# SoOlmwy/eJdsuuV94b3XWMNCOS+Q1cDe+x7U++8ZIXRInOiY3vXbN5U+1Qizd3je
# pt8nbqRa35+9lyf/0a/Bb1BjAdgFMMsUMNwExwNgrCwCM3AO4tkTgX9w5c7Zlts2
# aAc0h/GsOtOzzlFlCxK6Xn4jk3xvZvVKPA+irMtViyUl84swV5lHRCijbIU+KEaf
# qcpqUy9ieJ8Ha/JTdebHxPPSy2DS0JjKxojtBOHPK3YKDD1XQrP2zwtFFHvAhE/V
# 9A37gDorKQ/6ZeDnq0HDY8Sxzpw2cxOrt61m/bUGFJrAoYIXADCCFvwGCisGAQQB
# gjcDAwExghbsMIIW6AYJKoZIhvcNAQcCoIIW2TCCFtUCAQMxDzANBglghkgBZQME
# AgEFADCCAVEGCyqGSIb3DQEJEAEEoIIBQASCATwwggE4AgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEIJbjLe4WbijNGO7liwyKNhrwHmBSXt7+rHaz86i5
# eBqQAgZjIxZzXFUYEzIwMjIxMDEwMDYyMDA3LjMzOFowBIACAfSggdCkgc0wgcox
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1p
# Y3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRoYWxlcyBUU1Mg
# RVNOOkQ2QkQtRTNFNy0xNjg1MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNloIIRVzCCBwwwggT0oAMCAQICEzMAAAGe/cIt2DFatrEAAQAAAZ4w
# DQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcN
# MjExMjAyMTkwNTIwWhcNMjMwMjI4MTkwNTIwWjCByjELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2Eg
# T3BlcmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046RDZCRC1FM0U3LTE2
# ODUxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0G
# CSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDu6VylSHXD8Da8XkVNIqDgwWpTrhL5
# XXBaw2Zzerm2srxV+NpL/Zv7pVASO/TDGhAEMcwZTxyajt8I4vZ4DnnF9TD4tP6E
# E5Qx1LQQoZAjq55UH9qqpc1nwRJNBlQi+WdAV7IiGjQBe8J+WYV3yvDqlEYFC5VM
# e8OsB7yOMpFrAIZq3DhPpTLJM1LRdNEVAtGFlLT5BbBw3FG6EgfQt6DifBYtsZqu
# hPAaER9PIALFQxA138+ihNRZJMJUMhXYaAS6oLRN6pYZDDoXy4qqcGGeINsRBRZ9
# 1TN6lQgad8Cna+qH0tDQsQSJQfv74nJdgzkIpvz/DnvUFNZ9vqmh2OxNn82pX4nL
# uzAZCP4+zmFGYPAlo6ycnTc9Y8XNu8XVJYvno8uYYigRdRm2AYIfw04DYFhURE9h
# kckKIhxjqERNRxA0ZeHTUHA5t6ZS3xTOJOWgeB5W3PRhuAQyhITjGaUQUAgSyXzD
# zrOakNTVbjj7+X8OGsFtR8OYPzBe7l31SLvudNOq8Sxh2VA+WoGmdzhf+W7JmIEG
# Ato//9u8HUtnoNzJK/dwS2MYucnimlOrxKVrnq9jv1hpgmHPobWHnnLhAgXnH4Sj
# abyPkF1CZd8I2DLC56I4weWpcrtp+TdhpvwBFvWi6onTs1uSFg4UBAotOVJjdXNK
# +01JVZF7nxs1cQIDAQABo4IBNjCCATIwHQYDVR0OBBYEFGjTPoPRdY6XPtQkSTro
# h9lkZbutMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRY
# MFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01p
# Y3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEF
# BQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9w
# a2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAo
# MSkuY3J0MAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZI
# hvcNAQELBQADggIBAFS5VY6hmc8GH2D18v+STQA+A+gT1duE3yuNn1mH41TLquzV
# NLW03AzAvuucYea1VaitRE5UYbIzxUsV9G8sTrXbdiczeVG66IpLullh4Ixqfn+x
# zGbPOZWUT6wAtgXq3FfMGY9k73qo/IQ5shoToeMhBmHLWeg53+tBcu8SzocSHJTi
# eWcv5KmnAtoJra5SmDdZdFBCz0cP3IUq4kedN0Q2KhKrMDRAeD/CCza2DX8Bj9tR
# ePycTnvfsScCc5VsxDNCannq8tVJ+HQazRVK8ANW2UMDgV63i7SKGb3+slKI/Y92
# ouMrTFhai6h4rCojzSsQtJQTCcnI0QTDoextzmaLsmtKu3jF2Ayh8gFed+KRDiDh
# tNcyZoJm+fmqaKhTIi9guPoed7wvn5zde93Zr6RXBTtXL0dlR0FMw/wPQVJjLVEa
# EnYWnKZH9lU8XZJV+xOmWFBFZkd+RnVOW3ZW5eBGsLeuzDCAamruyotw4PD36T6e
# YGJv5YvrX1iRYADrxXCUYidrZJY2s0IVZFicqGgp5FtYYnAMpE7tyuIj2o4y+ol1
# by3lQV6Ob0P4RnK6gnuECWBfmWSjevOfr+02mkseW8oREHAm9y9XfcdUcQ57vbba
# u8+AQia8wGQcNXpxAnoLDwJ+RAycDlpe3e2Yha9nXuYzcVMk92r/bKI0fyGOMIIH
# cTCCBVmgAwIBAgITMwAAABXF52ueAptJmQAAAAAAFTANBgkqhkiG9w0BAQsFADCB
# iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMp
# TWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMjEw
# OTMwMTgyMjI1WhcNMzAwOTMwMTgzMjI1WjB8MQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQ
# Q0EgMjAxMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOThpkzntHIh
# C3miy9ckeb0O1YLT/e6cBwfSqWxOdcjKNVf2AX9sSuDivbk+F2Az/1xPx2b3lVNx
# WuJ+Slr+uDZnhUYjDLWNE893MsAQGOhgfWpSg0S3po5GawcU88V29YZQ3MFEyHFc
# UTE3oAo4bo3t1w/YJlN8OWECesSq/XJprx2rrPY2vjUmZNqYO7oaezOtgFt+jBAc
# nVL+tuhiJdxqD89d9P6OU8/W7IVWTe/dvI2k45GPsjksUZzpcGkNyjYtcI4xyDUo
# veO0hyTD4MmPfrVUj9z6BVWYbWg7mka97aSueik3rMvrg0XnRm7KMtXAhjBcTyzi
# YrLNueKNiOSWrAFKu75xqRdbZ2De+JKRHh09/SDPc31BmkZ1zcRfNN0Sidb9pSB9
# fvzZnkXftnIv231fgLrbqn427DZM9ituqBJR6L8FA6PRc6ZNN3SUHDSCD/AQ8rdH
# GO2n6Jl8P0zbr17C89XYcz1DTsEzOUyOArxCaC4Q6oRRRuLRvWoYWmEBc8pnol7X
# KHYC4jMYctenIPDC+hIK12NvDMk2ZItboKaDIV1fMHSRlJTYuVD5C4lh8zYGNRiE
# R9vcG9H9stQcxWv2XFJRXRLbJbqvUAV6bMURHXLvjflSxIUXk8A8FdsaN8cIFRg/
# eKtFtvUeh17aj54WcmnGrnu3tz5q4i6tAgMBAAGjggHdMIIB2TASBgkrBgEEAYI3
# FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQWBBQqp1L+ZMSavoKRPEY1Kc8Q/y8E7jAd
# BgNVHQ4EFgQUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXAYDVR0gBFUwUzBRBgwrBgEE
# AYI3TIN9AQEwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMI
# MBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMB
# Af8EBTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1Ud
# HwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3By
# b2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQRO
# MEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2Vy
# dHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0MA0GCSqGSIb3DQEBCwUAA4IC
# AQCdVX38Kq3hLB9nATEkW+Geckv8qW/qXBS2Pk5HZHixBpOXPTEztTnXwnE2P9pk
# bHzQdTltuw8x5MKP+2zRoZQYIu7pZmc6U03dmLq2HnjYNi6cqYJWAAOwBb6J6Gng
# ugnue99qb74py27YP0h1AdkY3m2CDPVtI1TkeFN1JFe53Z/zjj3G82jfZfakVqr3
# lbYoVSfQJL1AoL8ZthISEV09J+BAljis9/kpicO8F7BUhUKz/AyeixmJ5/ALaoHC
# gRlCGVJ1ijbCHcNhcy4sa3tuPywJeBTpkbKpW99Jo3QMvOyRgNI95ko+ZjtPu4b6
# MhrZlvSP9pEB9s7GdP32THJvEKt1MMU0sHrYUP4KWN1APMdUbZ1jdEgssU5HLcEU
# BHG/ZPkkvnNtyo4JvbMBV0lUZNlz138eW0QBjloZkWsNn6Qo3GcZKCS6OEuabvsh
# VGtqRRFHqfG3rsjoiV5PndLQTHa1V1QJsWkBRH58oWFsc/4Ku+xBZj1p/cvBQUl+
# fpO+y/g75LcVv7TOPqUxUYS8vwLBgqJ7Fx0ViY1w/ue10CgaiQuPNtq6TPmb/wrp
# NPgkNWcr4A245oyZ1uEi6vAnQj0llOZ0dFtq0Z4+7X6gMTN9vMvpe784cETRkPHI
# qzqKOghif9lwY1NNje6CbaUFEMFxBmoQtB1VM1izoXBm8qGCAs4wggI3AgEBMIH4
# oYHQpIHNMIHKMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSUw
# IwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMSYwJAYDVQQLEx1U
# aGFsZXMgVFNTIEVTTjpENkJELUUzRTctMTY4NTElMCMGA1UEAxMcTWljcm9zb2Z0
# IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAAhXCOZBbDxA/B5Te
# i6Rf80L9GheggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
# Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAN
# BgkqhkiG9w0BAQUFAAIFAObt4KswIhgPMjAyMjEwMTAwODA3MDdaGA8yMDIyMTAx
# MTA4MDcwN1owdzA9BgorBgEEAYRZCgQBMS8wLTAKAgUA5u3gqwIBADAKAgEAAgIJ
# LAIB/zAHAgEAAgIRwTAKAgUA5u8yKwIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgor
# BgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBBQUA
# A4GBAHc2nGf4V+Ri5rJemx7O0fTOzH28BrKTUpxW6x941gJ3iYx0gnTsBR2w1huz
# PvMRlfmLvCj4sTvEiOoP8hUREfAGTGxb6s0+oOL7NT3FdoqPTAkOVGzE+WC8CdCq
# BfE525k3anQicoLe+TEVyDA5gzyuwhqbzFNewS5kgAVLhrUKMYIEDTCCBAkCAQEw
# gZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UE
# AxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAGe/cIt2DFatrEA
# AQAAAZ4wDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0B
# CRABBDAvBgkqhkiG9w0BCQQxIgQgHYq0vGV0EdCKLvENcI3iAYZ5fWd30amLutoR
# dAfE/gEwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCAOxVYyIv5cj0+pZkJu
# rJ+yCrq0Re5XgrkfStUO/W88GTCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwAhMzAAABnv3CLdgxWraxAAEAAAGeMCIEIAmBiavSd1H1mc5mDS0X
# RMY8qDML8OTCC6zOhlk61CwSMA0GCSqGSIb3DQEBCwUABIICAIF2NNGON4Ku6VKH
# olkdQkuQjNJ1ek8JyD4Ef1c+hJMJnTT/N1ATQP+Ox0uer9B7J1jWxbQKTxF2L8bl
# bjsDTJW6W1s0kwVlC/aHRM1qOOccD2ortagD7lReZMSlHg0zthP42XAmipWeGYQK
# O0hqxR8Svg3POxIRfEIEIaa15LZ++wF7KB0vo41D09EYiRLN+0fdYQYwHCCZgpZj
# V8JCCq5uXvvHV1dREhMFSYhxfdDcAZinIzn/4es3SYzOe3lYhZ9nZd36v396lgSN
# lIg6wXV2FHYBm4u1J/G95Sz96WJeJS6YDsT33u0g4Vl6PVFR0nWrrBsy/5Ma/vzg
# 2fYB/uccPWFy5OziD4RP7Tc41xN789YmVJo2x5RHKo3eUGxd5IsSIwdJWMkcUMg6
# cHOdvb+r7wfL+0TqgimrCUvV/ikJ3ZScaUDt5oIfEo0nb9KC4D2QL6PGrf3XyDsW
# wXmX6mKlg4l+KT3MljL0cfcnDqXClrZVOl2oawr8Hze0YIUIsWVsDi5w1cKO9e+1
# BZcTwzYFIRC7NLqOXzH75Bh9+/m83S1LPvcVOjDVUamUroXa3KM0jcAkd9jQYfdQ
# VIoUo07jgGIPQUHt57Lm3HOVK3BTcNFS5unsI9WIHSIZB02wQDpWaqDtsbdvmebH
# +jZLTTRKn0+9qMazur9nAgBSV01P
# SIG # End signature block
