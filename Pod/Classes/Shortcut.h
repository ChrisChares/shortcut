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

+(NSString *)viewControllerStringFromURL:(NSURL *)url;
@end
