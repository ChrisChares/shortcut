//
//  Shortcut.m
//  Pods
//
//  Created by Chris Chares on 1/7/15.
//
//

#import "Shortcut.h"

@implementation Shortcut

+ (BOOL)nibExists:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"nib"];
    return path != nil;
}


+ (UIViewController *)load:(NSString *)url
{
    return nil;
}

@end
