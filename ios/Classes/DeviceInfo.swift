//
//  DeviceInfo.swift
//  flutter_device_details
//
//  Created by Mayur'sMAC on 19/08/2020.
//

import Foundation


public class DeviceInfo{
    
    func getDeviceInfo()-> Dictionary<String,Any>{

    let device = UIDevice.current;
    var un = utsname();
    uname(&un);

    let deviceInfo:Dictionary<String,Any> = ["name":device.name,
                                                "systemName":device.systemName,
                                                "systemVersion" :device.systemVersion,
                                                "model":device.model,
                                                "localizedModel":device.localizedModel,
                                                "identifierForVendor":device.identifierForVendor?.uuidString ?? "",
                                                "isPhysicalDevice":isDevicePhysical(),
                                                "utsname":[
                                                    "sysname": getDeviceUTFString(code:un.sysname),
                                                    "nodename":getDeviceUTFString(code:un.nodename),
                                                    "release": getDeviceUTFString(code:un.release),
                                                    "version":getDeviceUTFString(code:un.version),
                                                    "machine":getDeviceUTFString(code:un.machine)]
                                            ];
    return deviceInfo;
        
    }
    
    func getDeviceUTFString(code: (Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8, Int8))->String{
        
        let machineMirror = Mirror(reflecting: code);
           let identifier = machineMirror.children.reduce("") { identifier, element in
                         guard let value = element.value as? Int8 , value != 0 else { return identifier }
               return identifier + String(UnicodeScalar(UInt8(value)))
               
           }
        return identifier;
    }
    
    func isDevicePhysical() -> String{
          #if TARGET_OS_SIMULATOR
           return "false"
          #else
           return "true"
          #endif
        
    }
    
}
