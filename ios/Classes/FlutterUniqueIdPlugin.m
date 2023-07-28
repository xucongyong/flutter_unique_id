#import "FlutterUniqueIdPlugin.h"
#import "UIDevice+FCUUID.h"

@implementation FlutterUniqueIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_unique_id"
            binaryMessenger:[registrar messenger]];
  FlutterUniqueIdPlugin* instance = [[FlutterUniqueIdPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getUniqueId" isEqualToString:call.method]) {
    result([[UIDevice currentDevice] uuid]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
