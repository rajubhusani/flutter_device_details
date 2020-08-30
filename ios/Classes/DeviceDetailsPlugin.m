#import "DeviceDetailsPlugin.h"

#if __has_include(<flutter_device_details/flutter_device_details-Swift.h>)
#import <flutter_device_details/flutter_device_details-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_device_details-Swift.h"
#endif

@implementation DeviceDetailsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceDetailsPlugin registerWithRegistrar:registrar];
}
@end
