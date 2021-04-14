import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_device_details/flutter_device_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isRooted = false;
  TelephonyInfo _teleInfo;
  String _ipAddress;
  String _ipv6Address;
  PackageInfo _packageInfo;
  AndroidDeviceInfo _androidDeviceInfo;
  Map<String, dynamic> _iosDeviceInfo;
  String _platformVetrsion;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
//      platformVersion = await DeviceDetails.platformVersion;
//      print(platformVersion);
      _ipAddress = await DeviceDetails.ipAddress;
      _ipv6Address = await DeviceDetails.ipv6Address;
      // _iosDeviceInfo =  _readIosDeviceInfo(await DeviceDetails.iosInfo);

      _isRooted = await DeviceDetails.jailbroken;

      _packageInfo = await DeviceDetails.fromPlatform;
      _platformVetrsion = await DeviceDetails.platformVersion;
      _androidDeviceInfo = await DeviceDetails.androidInfo;
      _teleInfo = await DeviceDetails.telePhoneInfo;

      print('ip Address: $_ipAddress');
      print('ip6 Address: $_ipv6Address');
      print('Device Info: $_iosDeviceInfo');

      print('Package Name:${_packageInfo.packageName}');
      print('Package appName:${_packageInfo.appName}');
      print('Package builNoName:${_packageInfo.buildNumber}');
      print('Package versionName:${_packageInfo.version}');

      // print('Platform Version:${ _platformVetrsion}');

      print('AndroidID:${_androidDeviceInfo.androidId}');
      print('Network Operator:${_teleInfo.simCarrierIdName}');
      print('Is Rooted Device: $_isRooted');
    } on PlatformException {
      platformVersion = 'Platform Exception.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname': data.utsname.sysname,
      'utsname.nodename': data.utsname.nodename,
      'utsname.release': data.utsname.release,
      'osVersion': data.utsname.version,
      'manufacturer': data.utsname.machine,
      'timezone': DateTime.now().timeZoneName
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
            ],
          ),
        ),
      ),
    );
  }
}
