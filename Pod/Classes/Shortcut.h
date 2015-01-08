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
typedef void(^NavigationHandler)(UIViewController *);
@interface Shortcut : NSObject

+ (void)setupWithNavigationHandler:(NavigationHandler)navigationHandler;

+ (void)openStringURL:(NSString *)url;
+ (BOOL)handleOpenURL:(NSURL *)url;

+ (UIViewController *)load:(NSString *)url;

+ (BOOL)nibExists:(NSString *)name;
+ (BOOL)classExists:(NSString *)name;

+ (NSString *)viewControllerStringFromURL:(NSURL *)url;
+ (NSDictionary *)queryParametersFromURL:(NSURL *)url;

+ (UIStoryboard*)mainStoryBoard;
+ (UIViewController *)viewControllerFromStoryBoardWithName:(NSString*)name;

@end
