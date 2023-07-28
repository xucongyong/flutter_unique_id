import 'flutter_unique_device_id_platform_interface.dart';

Future<String?> getOnlyUniqueDeviceId() {
  return OnlyUniqueDeviceIdPlatform.instance.getOnlyUniqueDeviceId();
}

class OnlyUniqueDeviceId {
  Future<String?> getOnlyUniqueDeviceId() {
    return OnlyUniqueDeviceIdPlatform.instance.getOnlyUniqueDeviceId();
  }
}
