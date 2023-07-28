import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'only_unique_device_id_platform_interface.dart';

/// An implementation of [OnlyUniqueDeviceIdPlatform] that uses method channels.
class MethodChannelOnlyUniqueDeviceId extends OnlyUniqueDeviceIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('only_unique_device_id');

  @override
  Future<String?> getOnlyUniqueDeviceId() async {
    final version =
        await methodChannel.invokeMethod<String>('getOnlyUniqueDeviceId');
    return version;
  }
}
