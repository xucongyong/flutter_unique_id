import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_unique_id_method_channel.dart';

abstract class FlutterUniqueIdPlatform extends PlatformInterface {
  /// Constructs a FlutterUniqueIdPlatform.
  FlutterUniqueIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterUniqueIdPlatform _instance = MethodChannelFlutterUniqueId();

  /// The default instance of [FlutterUniqueIdPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterUniqueId].
  static FlutterUniqueIdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterUniqueIdPlatform] when
  /// they register themselves.
  static set instance(FlutterUniqueIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getUniqueId() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
