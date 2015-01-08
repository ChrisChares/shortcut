//
//  Shortcut.h
//  Pods
//
//  Created by Chris Chares on 1/7/15.
//
//

#import <UIKit/UIKit.h>
#import "ShortcutParams.h"

#define openURL(x) [[UIApplication sharedApplication] openURL:x]

@interface Shortcut : NSObject

+(void)openStringURL:(NSString *)url;

+(UIViewController *)load:(NSString *)url;

+(BOOL)nibExists:(NSString *)name;
+(BOOL)classExists:(NSString *)name;

+(NSString *)viewControllerStringFromURL:(NSURL *)url;
+(NSDictionary *)queryParametersFromURL:(NSURL *)url;

+ (UIStoryboard*)mainStoryBoard;
+ (UIViewController *)viewControllerFromStoryBoardWithName:(NSString*)name;

@end
