import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'only_unique_device_id_method_channel.dart';

abstract class OnlyUniqueDeviceIdPlatform extends PlatformInterface {
  /// Constructs a OnlyUniqueDeviceIdPlatform.
  OnlyUniqueDeviceIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static OnlyUniqueDeviceIdPlatform _instance =
      MethodChannelOnlyUniqueDeviceId();

  /// The default instance of [OnlyUniqueDeviceIdPlatform] to use.
  ///
  /// Defaults to [MethodChannelOnlyUniqueDeviceId].
  static OnlyUniqueDeviceIdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OnlyUniqueDeviceIdPlatform] when
  /// they register themselves.
  static set instance(OnlyUniqueDeviceIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getOnlyUniqueDeviceId() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
