package com.reverse.flutter_unique_device_id;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import android.content.Context;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.View;
import java.util.UUID;


/** OnlyUniqueDeviceIdPlugin */
public class OnlyUniqueDeviceIdPlugin implements FlutterPlugin, MethodCallHandler {

  private MethodChannel channel;
  private FlutterPluginBinding _flutterPluginBinding;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_unique_device_id");
    channel.setMethodCallHandler(this);
    _flutterPluginBinding = flutterPluginBinding;
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getOnlyUniqueDeviceId")) {
      String deviceId = getUniquePsuedoID();
      result.success(deviceId);
    } else {
      result.notImplemented();
    }
  }

    private String getUniquePsuedoID() {

        String m_szDevIDShort = "35" + (Build.BOARD.length() % 10) + (Build.BRAND.length() % 10) + (Build.CPU_ABI.length() % 10) + (Build.DEVICE.length() % 10) + (Build.MANUFACTURER.length() % 10) + (Build.MODEL.length() % 10) + (Build.PRODUCT.length() % 10);

        String serial = null;
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                serial = android.os.Build.getSerial();
            } else {
                serial = Build.SERIAL;
            }
            // Go ahead and return the serial for api => 9
            return new UUID(m_szDevIDShort.hashCode(), serial.hashCode()).toString();
        } catch (Exception exception) {
            // String needs to be initialized
            final String androidId = "" + android.provider.Settings.Secure.getString(_flutterPluginBinding.getApplicationContext().getContentResolver(), android.provider.Settings.Secure.ANDROID_ID);
            serial = androidId;
        }

      return new UUID(m_szDevIDShort.hashCode(), serial.hashCode()).toString();
    };
  
  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
  
};