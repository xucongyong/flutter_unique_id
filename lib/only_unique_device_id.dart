import 'only_unique_device_id_platform_interface.dart';

class OnlyUniqueDeviceId {
  Future<String?> getOnlyUniqueDeviceId() {
    return OnlyUniqueDeviceIdPlatform.instance.getOnlyUniqueDeviceId();
  }
}
