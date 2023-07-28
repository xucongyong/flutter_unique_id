import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_unique_id_platform_interface.dart';

/// An implementation of [FlutterUniqueIdPlatform] that uses method channels.
class MethodChannelFlutterUniqueId extends FlutterUniqueIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_unique_id');

  @override
  Future<String?> getUniqueId() async {
    final version = await methodChannel.invokeMethod<String>('getUniqueId');
    return version;
  }
}
