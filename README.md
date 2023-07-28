# unique_device_id

A flutter plugin that can get a unique deviceId 


# use

```dart
import 'package:only_unique_device_id/only_unique_device_id.dart' as OnlyUniqueDeviceId;

Future<String?> get_only_unique_device_id() async {
  // ignore: non_constant_identifier_names
  String? UniqueDeviceId =
      await OnlyUniqueDeviceId.OnlyUniqueDeviceId().getOnlyUniqueDeviceId();
  print(UniqueDeviceId);
  return UniqueDeviceId;
}
```

## About android
I know there isn't any 'perfect' way of getting a unique ID without using permissions; however, sometimes we only really need to track the device installation. When it comes to creating a unique ID, we can create a 'pseudo unique id' based solely on information that the Android API gives us without using extra permissions. This way, we can show the user respect and try to offer a good user experience as well.

how does it work?<br>

```Java
	private String getUniquePsuedoID() {
        // If all else fails, if the user does have lower than API 9 (lower
        // than Gingerbread), has reset their device or 'Secure.ANDROID_ID'
        // returns 'null', then simply the ID returned will be solely based
        // off their Android device information. This is where the collisions
        // can happen.
        // Thanks http://www.pocketmagic.net/?p=1662!
        // Try not to use DISPLAY, HOST or ID - these items could change.
        // If there are collisions, there will be overlapping data
        String m_szDevIDShort = "35" + (Build.BOARD.length() % 10) + (Build.BRAND.length() % 10) + (Build.CPU_ABI.length() % 10) + (Build.DEVICE.length() % 10) + (Build.MANUFACTURER.length() % 10) + (Build.MODEL.length() % 10) + (Build.PRODUCT.length() % 10);

        // Thanks to @Roman SL!
        // https://stackoverflow.com/a/4789483/950427
        // Only devices with API >= 9 have android.os.Build.SERIAL
        // http://developer.android.com/reference/android/os/Build.html#SERIAL
        // If a user upgrades software or roots their device, there will be a duplicate entry
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

        // if Build.SERIAL get successfuly, the 'id' is unique very likely, if not, we use androidId to guarante 'id' to be unique as possible
        // without any permissions


        // Thanks @Joe!
        // https://stackoverflow.com/a/2853253/950427
        // Finally, combine the values we have found by using the UUID class to create a unique identifier
        return new UUID(m_szDevIDShort.hashCode(), serial.hashCode()).toString();
    }
```

## About ios
CFUUID + KeyChain

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Thanks
- [is-there-a-unique-android-device-id](https://stackoverflow.com/questions/2785485/is-there-a-unique-android-device-id)
- [FCUUID](https://github.com/fabiocaccamo/FCUUID)
- [UICKeyChainStore](https://github.com/kishikawakatsumi/UICKeyChainStore)



# only_unique_device_id

A new Flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# only_unique_device_id
