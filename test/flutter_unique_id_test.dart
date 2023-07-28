import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unique_id/flutter_unique_id.dart';
import 'package:flutter_unique_id/flutter_unique_id_platform_interface.dart';
import 'package:flutter_unique_id/flutter_unique_id_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterUniqueIdPlatform
    with MockPlatformInterfaceMixin
    implements FlutterUniqueIdPlatform {
  @override
  Future<String?> getUniqueId() => Future.value('42');
}

void main() {
  final FlutterUniqueIdPlatform initialPlatform =
      FlutterUniqueIdPlatform.instance;

  test('$MethodChannelFlutterUniqueId is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterUniqueId>());
  });

  test('getUniqueId', () async {
    FlutterUniqueId flutterUniqueIdPlugin = FlutterUniqueId();
    MockFlutterUniqueIdPlatform fakePlatform = MockFlutterUniqueIdPlatform();
    FlutterUniqueIdPlatform.instance = fakePlatform;

    expect(await flutterUniqueIdPlugin.getUniqueId(), '42');
  });
}
