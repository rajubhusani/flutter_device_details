package com.fab.devicedetails

import android.annotation.SuppressLint
import android.content.ContentResolver
import android.content.pm.FeatureInfo
import android.content.pm.PackageManager
import android.os.Build
import android.provider.Settings
import java.util.*
import kotlin.collections.HashMap


class DeviceInfo(private val contentResolver: ContentResolver, private val packageManager: PackageManager) {

    /** Substitute for missing values.  */
    private val EMPTY_STRING_LIST = arrayOf<String?>()

    fun getAndroidDeviceInfo(): Map<Any, Any> {

        val build: MutableMap<Any, Any> = HashMap()
        build["board"] = Build.BOARD
        build["bootloader"] = Build.BOOTLOADER
        build["brand"] = Build.BRAND
        build["device"] = Build.DEVICE
        build["display"] = Build.DISPLAY
        build["fingerprint"] = Build.FINGERPRINT
        build["hardware"] = Build.HARDWARE
        build["host"] = Build.HOST
        build["id"] = Build.ID
        build["manufacturer"] = Build.MANUFACTURER
        build["model"] = Build.MODEL
        build["product"] = Build.PRODUCT
        build["tags"] = Build.TAGS
        build["type"] = Build.TYPE
        build["isPhysicalDevice"] = !isEmulator()
        build["androidId"] = getAndroidId().toString()

        val version: MutableMap<String, Any> = HashMap()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            version["baseOS"] = Build.VERSION.BASE_OS
            version["previewSdkInt"] = Build.VERSION.PREVIEW_SDK_INT
            version["securityPatch"] = Build.VERSION.SECURITY_PATCH
        }
        version["codename"] = Build.VERSION.CODENAME
        version["incremental"] = Build.VERSION.INCREMENTAL
        version["release"] = Build.VERSION.RELEASE
        version["sdkInt"] = Build.VERSION.SDK_INT
        build["version"] = version

        return build
    }

    /**
     * Returns the Android hardware device ID that is unique between the device + user and app
     * signing. This key will change if the app is uninstalled or its data is cleared. Device factory
     * reset will also result in a value change.
     *
     * @return The android ID
     */
    @SuppressLint("HardwareIds")
    private fun getAndroidId(): String? {
        return Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
    }

    /**
     * A simple emulator-detection based on the flutter tools detection logic and a couple of legacy
     * detection systems
     */
    private fun isEmulator(): Boolean {
        return (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic")
                || Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.startsWith("unknown")
                || Build.HARDWARE.contains("goldfish")
                || Build.HARDWARE.contains("ranchu")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || Build.PRODUCT.contains("sdk_google")
                || Build.PRODUCT.contains("google_sdk")
                || Build.PRODUCT.contains("sdk")
                || Build.PRODUCT.contains("sdk_x86")
                || Build.PRODUCT.contains("vbox86p")
                || Build.PRODUCT.contains("emulator")
                || Build.PRODUCT.contains("simulator"))
    }

}