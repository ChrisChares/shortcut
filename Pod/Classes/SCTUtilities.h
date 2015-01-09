//
//  SCTUtilities.h
//  Pods
//
//  Created by Chris Chares on 1/8/15.
//
//

#import <Foundation/Foundation.h>

@interface SCTUtilities : NSObject

+ (BOOL)nibExists:(NSString *)name;
+ (BOOL)classExists:(NSString *)name;
+ (NSString *)viewControllerStringFromURL:(NSURL *)url;
+ (NSDictionary *)queryParametersFromURL:(NSURL *)url;
+ (UIStoryboard*)mainStoryBoard;
+ (UIViewController *)viewControllerFromStoryBoardWithName:(NSString*)name;


@end
