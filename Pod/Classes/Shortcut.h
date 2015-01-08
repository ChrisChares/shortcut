//
//  Shortcut.h
//  Pods
//
//  Created by Chris Chares on 1/7/15.
//
//

#import <UIKit/UIKit.h>

@interface Shortcut : NSObject

+(UIViewController *)load:(NSString *)url;

+(BOOL)nibExists:(NSString *)name;
+(BOOL)classExists:(NSString *)name;

+(NSString *)viewControllerStringFromURL:(NSURL *)url;
+(NSDictionary *)queryParametersFromURL:(NSURL *)url;

+ (UIStoryboard*)mainStoryBoard;
+ (UIViewController *)viewControllerFromStoryBoardWithName:(NSString*)name;

@end
