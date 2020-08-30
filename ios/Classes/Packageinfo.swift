//
//  Packageinfo.swift
//  flutter_device_details
//
//  Created by Mayur'sMAC on 19/08/2020.
//

import Foundation

public class Packageinfo {
    
    func getPackageInfo() ->Dictionary<String,Any>{
           
           let deviceInfo:Dictionary<String,Any> = [
            "appName" :  Bundle.main.object(forInfoDictionaryKey: "CFBundleName") ?? "",
            "packageName" : Bundle.main.bundleIdentifier ?? "",
            "version" :  Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "",
            "buildNumber" : Bundle.main.object(forInfoDictionaryKey:"CFBundleVersion") ?? ""
          ]
        
        return deviceInfo;
      }
}
