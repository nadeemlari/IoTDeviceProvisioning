
@description('The SKU to use for the IoT Hub.')
param skuName string = 'S1'

@description('The number of IoT Hub units.')
param skuUnits int = 1

@description('Specify the location of the resources.')
param location string = resourceGroup().location

var iotHubKey = 'iothubowner'

resource iotHub 'Microsoft.Devices/IotHubs@2021-07-02' = {
  name:'mnlhub'
  location: location
  sku: {
    name: skuName
    capacity: skuUnits
  }
  properties: {}
}

//resource provisioningService 'Microsoft.Devices/provisioningServices@2022-02-05' = {
//  name: 'mnldp'
//  location: location
//  sku: {
//    name: skuName
//    capacity: skuUnits
//  }
  
//  properties: {
//    iotHubs: [
//      {
//        connectionString: 'HostName=${iotHub.properties.hostName};SharedAccessKeyName=${iotHubKey};SharedAccessKey=${iotHub.listkeys().value}'
//        location: location
//      }
//    ]
//  }
//}