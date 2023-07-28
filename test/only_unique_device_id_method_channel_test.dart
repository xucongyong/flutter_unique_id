import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:only_unique_device_id/only_unique_device_id_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelOnlyUniqueDeviceId platform = MethodChannelOnlyUniqueDeviceId();
  const MethodChannel channel = MethodChannel('only_unique_device_id');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getOnlyUniqueDeviceId', () async {
    expect(await platform.getOnlyUniqueDeviceId(), '42');
  });
}
