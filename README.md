# DeviceDetails

A new flutter plugin project for the Native device essentials.

* Device Info
* Package Info
* Telephony Info
* Ip Info
* Jaibreak/Root detection

## Usage

You need to import the package:

import 'package:flutter_device_details/flutter_device_details.dart';

### Use this

  String _ipAddress = await DeviceDetails.ipAddress;
  bool _isRooted = await DeviceDetails.jailbroken;
  TelephonyInfo _teleInfo = await DeviceDetails.telePhoneInfo;
  PackageInfo _packageInfo = await DeviceDetails.fromPlatform;
  AndroidDeviceInfo _androidDeviceInfo = await DeviceDetails.androidInfo;
  print('ip Address: $_ipAddress');
  print('Package Name:${ _packageInfo.packageName }');
  print('AndroidID:${ _androidDeviceInfo.androidId}');
  print('Network Operator:${ _teleInfo.simCarrierIdName}');
  print('Is Rooted Device: $_isRooted');
