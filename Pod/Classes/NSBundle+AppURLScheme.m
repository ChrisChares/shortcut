//
//  NSBundle+AppURLScheme.m
//  Pods
//
//  Created by Chris Chares on 1/8/15.
//
//

#import "NSBundle+AppURLScheme.h"

@implementation NSBundle (AppURLScheme)

- (NSString *)appURLScheme {
    NSDictionary *plist = [[NSBundle mainBundle] infoDictionary];
    return nil;
//    plist[@"CFBundleURLTypes"][0][@"CFBundleURLSchemes"];
}

@end
