import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'unique_id_method_channel.dart';

abstract class UniqueIdPlatform extends PlatformInterface {
  /// Constructs a UniqueIdPlatform.
  UniqueIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static UniqueIdPlatform _instance = MethodChannelUniqueId();

  /// The default instance of [UniqueIdPlatform] to use.
  ///
  /// Defaults to [MethodChannelUniqueId].
  static UniqueIdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UniqueIdPlatform] when
  /// they register themselves.
  static set instance(UniqueIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getUniqueId() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
