# DeviceDetails

A new flutter plugin project for the Native device essentials.

### Currently Supporting only Android and iOS will be added soon

* Device Info
* Package Info
* Telephony Info
* Ip Info
* Jaibreak/Root detection

## Usage

You need to import the package:

import 'package:flutter_device_details/flutter_device_details.dart';

### Use this
```
  String _ipAddress = await DeviceDetails.ipAddress; // Get IP Address
  bool _isRooted = await DeviceDetails.jailbroken; // is Device Rooted
  TelephonyInfo _teleInfo = await DeviceDetails.telePhoneInfo; // Get Telephony Info
  PackageInfo _packageInfo = await DeviceDetails.fromPlatform; // Get Package Info
  AndroidDeviceInfo _androidDeviceInfo = await DeviceDetails.androidInfo; // Get Android Info
  print('ip Address: $_ipAddress');
  print('Package Name:${ _packageInfo.packageName }');
  print('AndroidID:${ _androidDeviceInfo.androidId}');
  print('Network Operator:${ _teleInfo.simCarrierIdName}');
  print('Is Rooted Device: $_isRooted');
```
