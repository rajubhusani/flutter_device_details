import 'dart:async';

import 'package:flutter_device_details/flutter_device_details.dart';
import 'package:flutter/foundation.dart';

class FlutterJailbreakDetection {

  static Future<bool> get jailbroken async {
    bool jailbroken = await channel.invokeMethod(describeEnum(METHODS.JAIL_BROKEN));
    return jailbroken;
  }

  static Future<bool> get developerMode async {
    bool developerMode = await channel.invokeMethod(describeEnum(METHODS.DEVELOPER_MODE));
    return developerMode;
  }
}