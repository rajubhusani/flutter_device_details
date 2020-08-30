import Flutter
import UIKit
import DTTJailbreakDetection


public class SwiftDeviceDetailsPlugin: NSObject, FlutterPlugin {
    
    enum METHODS :String{
      case PLATFORM_VERSION
      case ANDROID_INFO
      case IOS_INFO
      case FROM_PLATFORM
      case IP_ADDRESS
      case IPV6_ADDRESS
      case TELE_PHONE_INFO
      case JAIL_BROKEN
      case DEVELOPER_MODE
    }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_device_details", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceDetailsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
           switch call.method {
            
           case METHODS.IP_ADDRESS.rawValue,METHODS.IPV6_ADDRESS.rawValue:
            let ip = IPAddress().getIPAddress(ipAddressType: call.method)
              result(ip)
            break;
            
           case METHODS.IOS_INFO.rawValue :
            let deviceInfo = DeviceInfo().getDeviceInfo()
             result(deviceInfo)
            break;
            
           case METHODS.FROM_PLATFORM.rawValue:
            let platformInfo = Packageinfo().getPackageInfo()
            result(platformInfo)
            break;
            
           case METHODS.PLATFORM_VERSION.rawValue:
            #if TARGET_OS_IPHONE
            result( "iOS \(UIDevice.current.systemVersion)");
            #else
            result("macOS \(ProcessInfo.processInfo.operatingSystemVersion)");
            #endif
            
           case METHODS.TELE_PHONE_INFO.rawValue:
            let phoneInfo = TelephonyInfo().getTelephonyInfo()
            result(phoneInfo);
            break;
            
            
           case METHODS.JAIL_BROKEN.rawValue:
                       
                       let isJailBroken = DTTJailbreakDetection.isJailbroken()
                   
                       result(isJailBroken)
                       break
            
           case METHODS.DEVELOPER_MODE.rawValue:
                       result(false)
           default:
               result(FlutterMethodNotImplemented);
               break;
           }
   }
    
  
    

    
   
    
    
    
    
}
