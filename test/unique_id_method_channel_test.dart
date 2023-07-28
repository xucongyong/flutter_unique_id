import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unique_id/unique_id_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelUniqueId platform = MethodChannelUniqueId();
  const MethodChannel channel = MethodChannel('unique_id');

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

  test('getUniqueId', () async {
    expect(await platform.getUniqueId(), '42');
  });
}
