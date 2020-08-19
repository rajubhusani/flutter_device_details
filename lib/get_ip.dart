import 'dart:async';

import 'package:flutter_device_details/flutter_device_details.dart';
import 'package:flutter/foundation.dart';

class GetIp {
  // static const MethodChannel _channel = const MethodChannel('get_ip');

  ///
  /// Returns the IPv4-Address the device is aware of
  /// (depending on your network configuration)
  /// Can be null
  static Future<String> get ipAddress async {
    final String ip = await channel.invokeMethod(describeEnum(METHODS.IP_ADDRESS));
    return ip;
  }

  ///
  /// Returns the users IPv6-Address the device is aware of
  /// (depending on your network configuration)
  /// Is null on iOS
  static Future<String> get ipv6Address async {
    final String ip = await channel.invokeMethod(describeEnum(METHODS.IPV6_ADDRESS));
    return ip;
  }
}