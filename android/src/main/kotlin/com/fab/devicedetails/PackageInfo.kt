package com.fab.devicedetails

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.content.pm.PackageInfoCompat.getLongVersionCode


class PackageInfo {

    fun getPackgeInfo(context: Context): Map<String, String>{
        val pm: PackageManager = context.packageManager
        val info: PackageInfo = pm.getPackageInfo(context.packageName, 0)

        val map: MutableMap<String, String> = HashMap()
        map["appName"] = info.applicationInfo.loadLabel(pm).toString()
        map["packageName"] = context.packageName
        map["version"] = info.versionName
        map["buildNumber"] = getLongVersionCode(info).toString()

        return map
    }
}