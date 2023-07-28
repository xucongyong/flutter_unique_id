import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'unique_id_platform_interface.dart';

/// An implementation of [UniqueIdPlatform] that uses method channels.
class MethodChannelUniqueId extends UniqueIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('unique_id');

  @override
  Future<String?> getUniqueId() async {
    final version = await methodChannel.invokeMethod<String>('getUniqueId');
    return version;
  }
}
