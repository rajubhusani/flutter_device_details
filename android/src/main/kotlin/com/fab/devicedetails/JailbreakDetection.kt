package com.fab.devicedetails

import android.content.Context
import android.provider.Settings

import com.scottyab.rootbeer.RootBeer

class JailbreakDetection {

    @android.annotation.TargetApi(17)
    fun isDevMode(context: Context): Boolean {
        return if (Integer.valueOf(android.os.Build.VERSION.SDK_INT) == 16) {
            Settings.Secure.getInt(context.contentResolver,
                    Settings.Secure.DEVELOPMENT_SETTINGS_ENABLED, 0) != 0
        } else if (Integer.valueOf(android.os.Build.VERSION.SDK) >= 17) {
            Settings.Secure.getInt(context.contentResolver,
                    Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0) != 0
        } else
            false
    }

    fun isJailbroken(context: Context): Boolean{
        val rootBeer = RootBeer(context)
        return rootBeer.isRooted;
    }
}