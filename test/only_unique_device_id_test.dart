import 'package:flutter_test/flutter_test.dart';
import 'package:only_unique_device_id/only_unique_device_id.dart';
import 'package:only_unique_device_id/only_unique_device_id_platform_interface.dart';
import 'package:only_unique_device_id/only_unique_device_id_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOnlyUniqueDeviceIdPlatform
    with MockPlatformInterfaceMixin
    implements OnlyUniqueDeviceIdPlatform {
  @override
  Future<String?> getOnlyUniqueDeviceId() => Future.value('42');
}

void main() {
  final OnlyUniqueDeviceIdPlatform initialPlatform =
      OnlyUniqueDeviceIdPlatform.instance;

  test('$MethodChannelOnlyUniqueDeviceId is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOnlyUniqueDeviceId>());
  });

  test('getOnlyUniqueDeviceId', () async {
    OnlyUniqueDeviceId onlyUniqueDeviceIdPlugin = OnlyUniqueDeviceId();
    MockOnlyUniqueDeviceIdPlatform fakePlatform =
        MockOnlyUniqueDeviceIdPlatform();
    OnlyUniqueDeviceIdPlatform.instance = fakePlatform;

    expect(await onlyUniqueDeviceIdPlugin.getOnlyUniqueDeviceId(), '42');
  });
}
