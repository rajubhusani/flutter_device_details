library flutter_device_details;

import 'package:flutter/services.dart';

export 'device_details.dart';
export 'device_info.dart';
export 'flt_telephony.dart';
export 'get_ip.dart';
export 'jailbreak_detection.dart';
export 'package_info.dart';

const MethodChannel channel = const MethodChannel('flutter_device_details');

enum METHODS {
  PLATFORM_VERSION,
  ANDROID_INFO,
  IOS_INFO,
  FROM_PLATFORM,
  IP_ADDRESS,
  IPV6_ADDRESS,
  TELE_PHONE_INFO,
  JAIL_BROKEN,
  DEVELOPER_MODE
}
