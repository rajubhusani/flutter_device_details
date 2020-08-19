package com.fab.devicedetails

import android.app.Activity
import android.content.Context
import android.util.Log
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** DeviceDetailsPlugin */
public class DeviceDetailsPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var applicationContext: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        this.applicationContext = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.flutterEngine.dartExecutor, "flutter_device_details")
        channel.setMethodCallHandler(this);
    }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            if (null == registrar.activity()) {
                return;
            }
            val channel = MethodChannel(registrar.messenger(), "flutter_device_details")
            channel.setMethodCallHandler(DeviceDetailsPlugin())
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            METHODS.PLATFORM_VERSION.name -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
            METHODS.ANDROID_INFO.name ->
                result.success(DeviceInfo(applicationContext!!.contentResolver,
                        applicationContext!!.packageManager).getAndroidDeviceInfo())
            METHODS.FROM_PLATFORM.name -> result.success(PackageInfo().getPackgeInfo(applicationContext!!))
            METHODS.IP_ADDRESS.name -> result.success(IPAddress().getIPAddress(true))
            METHODS.IPV6_ADDRESS.name -> result.success(IPAddress().getIPAddress(false))
            METHODS.TELE_PHONE_INFO.name -> result.success(FltTelephonyInfo().getTelephonyInfo(applicationContext!!))
            METHODS.JAIL_BROKEN.name -> result.success(JailbreakDetection().isJailbroken(applicationContext!!))
            METHODS.DEVELOPER_MODE.name -> result.success(JailbreakDetection().isDevMode(applicationContext!!))
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
