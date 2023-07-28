#import "OnlyUniqueDeviceIdPlugin.h"
#import "UIDevice+FCUUID.h"

@implementation OnlyUniqueDeviceIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"only_unique_device_id"
            binaryMessenger:[registrar messenger]];
  OnlyUniqueDeviceIdPlugin* instance = [[OnlyUniqueDeviceIdPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getOnlyUniqueDeviceId" isEqualToString:call.method]) {
    result([[UIDevice currentDevice] uuid]);
    // result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
