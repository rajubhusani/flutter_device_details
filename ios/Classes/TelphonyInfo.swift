//
//  TelphonyInfo.swift
//  flutter_device_details
//
//  Created by Mayur'sMAC on 30/08/2020.
//

import Foundation
import CoreTelephony


public class TelephonyInfo {

func getTelephonyInfo() ->NSMutableDictionary{
    
    let networkInfo = CTTelephonyNetworkInfo();
     
    let  dict: NSMutableDictionary = NSMutableDictionary();
     
    let carrier:CTCarrier = networkInfo.subscriberCellularProvider ?? CTCarrier();
     
     
     //运营商名称
    let carrierName:String? = carrier.carrierName;
    
    if (carrierName != nil) {
         dict["simCarrierIdName"]=carrierName;
     }
     
    var `operator` = "";
    
     //国家编号
    let mobileCountryCode = carrier.mobileCountryCode  ;
     //运营商网络编号
    let mobileNetworkCode = carrier.mobileNetworkCode;
     
     if (mobileCountryCode != nil) {
         //dict[@"networkCountryIso"]=mobileCountryCode;
        `operator`.append(mobileCountryCode!)
         
     }
     if (mobileNetworkCode != nil) {
         //dict[@"mobileNetworkCode"]=mobileNetworkCode;
        `operator`.append(mobileNetworkCode!)
     }
    
     dict["simOperator"] = `operator`;
     dict["networkOperator"] = `operator`;
     
    let isoCountryCode = carrier.isoCountryCode;
     if (isoCountryCode != nil) {
         dict["simCountryIso"]=isoCountryCode;
         dict["networkCountryIso"]=isoCountryCode;
     }
     dict["isVoiceCapable"] = (carrier.allowsVOIP);
     
     
     //只能获取的是机主设置的本机号码，不能读取sim卡上的电话号码
    
    let number = UserDefaults.standard.value(forKey: "SBFormattedPhoneNumber");
     if (number != nil) {
         dict["line1Number"]=number;
     }
    return dict;
    
}

}
