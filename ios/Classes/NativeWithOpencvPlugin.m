#import "NativeWithOpencvPlugin.h"
#if __has_include(<native_with_opencv/native_with_opencv-Swift.h>)
#import <native_with_opencv/native_with_opencv-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "native_with_opencv-Swift.h"
#endif

@implementation NativeWithOpencvPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativeWithOpencvPlugin registerWithRegistrar:registrar];
}
@end
