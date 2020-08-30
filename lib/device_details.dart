import 'dart:async';

import 'package:flutter_device_details/device_info.dart';
import 'package:flutter_device_details/flt_telephony.dart';
import 'package:flutter_device_details/flutter_device_details.dart';
import 'package:flutter_device_details/get_ip.dart';
import 'package:flutter_device_details/jailbreak_detection.dart';
import 'package:flutter_device_details/package_info.dart';
import 'package:flutter/foundation.dart';

class DeviceDetails {
  static DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<AndroidDeviceInfo> get androidInfo async =>
      _deviceInfoPlugin.androidInfo;

  static Future<IosDeviceInfo> get iosInfo async => _deviceInfoPlugin.iosInfo;

  static Future<PackageInfo> get fromPlatform async =>
      PackageInfo.fromPlatform();

  static Future<String> get ipAddress async => GetIp.ipAddress;

  static Future<String> get ipv6Address async => GetIp.ipv6Address;



  static Future<TelephonyInfo> get telePhoneInfo => FltTelephonyInfo.info;

  static Future<bool> get jailbroken => FlutterJailbreakDetection.jailbroken;

  static Future<bool> get developerMode =>
      FlutterJailbreakDetection.developerMode;

  static Future<String> get platformVersion async =>
      await channel.invokeMethod(describeEnum(METHODS.PLATFORM_VERSION));
}
