import 'package:flutter_test/flutter_test.dart';
import 'package:unique_id/unique_id.dart';
import 'package:unique_id/unique_id_platform_interface.dart';
import 'package:unique_id/unique_id_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUniqueIdPlatform
    with MockPlatformInterfaceMixin
    implements UniqueIdPlatform {
  @override
  Future<String?> getUniqueId() => Future.value('42');
}

void main() {
  final UniqueIdPlatform initialPlatform = UniqueIdPlatform.instance;

  test('$MethodChannelUniqueId is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUniqueId>());
  });

  test('getUniqueId', () async {
    MockUniqueIdPlatform fakePlatform = MockUniqueIdPlatform();
    UniqueIdPlatform.instance = fakePlatform;

    expect(await getUniqueId(), '42');
  });
}
