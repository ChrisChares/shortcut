//
//  Shortcut.h
//  Pods
//
//  Created by Chris Chares on 1/7/15.
//
//

#import <UIKit/UIKit.h>
#import "ShortcutParams.h"

#define openURL(x) [Shortcut openStringURL:x]

typedef void(^ShortcutNavigationHandler)(UIViewController *);

@interface Shortcut : NSObject

+ (void)openStringURL:(NSString *)url;
+ (BOOL)handleOpenURL:(NSURL *)url navigationHandler:(ShortcutNavigationHandler)navHandler;

+ (UIViewController *)load:(NSString *)url;




@end
