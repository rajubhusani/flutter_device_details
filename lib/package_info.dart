import 'dart:async';

import 'package:flutter_device_details/flutter_device_details.dart';
import 'package:flutter/foundation.dart';

class PackageInfo {

  PackageInfo({
    this.appName,
    this.packageName,
    this.version,
    this.buildNumber,
  });

  static PackageInfo _fromPlatform;
  
  static Future<PackageInfo> fromPlatform() async {
    if (_fromPlatform != null) {
      return _fromPlatform;
    }

    final Map<String, dynamic> map =
        await channel.invokeMapMethod<String, dynamic>(describeEnum(METHODS.FROM_PLATFORM));
    _fromPlatform = PackageInfo(
      appName: map["appName"],
      packageName: map["packageName"],
      version: map["version"],
      buildNumber: map["buildNumber"],
    );
    return _fromPlatform;
  }

  /// The app name. `CFBundleDisplayName` on iOS, `application/label` on Android.
  final String appName;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.
  final String packageName;

  /// The package version. `CFBundleShortVersionString` on iOS, `versionName` on Android.
  final String version;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  final String buildNumber;
}
