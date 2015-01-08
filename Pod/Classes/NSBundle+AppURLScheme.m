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
    NSDictionary *plist = [self infoDictionary];
    return [[plist[@"CFBundleURLTypes"] firstObject][@"CFBundleURLSchemes"] firstObject];
}

@end
