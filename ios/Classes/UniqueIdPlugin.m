#import "UniqueIdPlugin.h"
#import "UIDevice+FCUUID.h"

@implementation UniqueIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"unique_id"
            binaryMessenger:[registrar messenger]];
  UniqueIdPlugin* instance = [[UniqueIdPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getUniqueId" isEqualToString:call.method]) {
    result([[UIDevice currentDevice] uuid]);
    //result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
