//
//  Shortcut.m
//  Pods
//
//  Created by Chris Chares on 1/7/15.
//
//

#import "Shortcut.h"
#import "XQueryComponents.h"

@implementation Shortcut

+ (BOOL)nibExists:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"nib"];
    return path != nil;
}

+ (BOOL)classExists:(NSString *)name {
    Class class = NSClassFromString(name);
    return class && [class isSubclassOfClass:[UIViewController class]];
}

+ (UIViewController *)load:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *vcString = [Shortcut viewControllerStringFromURL:url];
    
    if ( [Shortcut nibExists:vcString] ) {
        return [[UIViewController alloc] initWithNibName:vcString bundle:nil];
    } else {
        //do the storyboard
        
        //then
        if ( [Shortcut classExists:vcString] ) {
            Class class = NSClassFromString(vcString);
            return [[class alloc] initWithNibName:vcString bundle:nil];
        }
    }
    
    
    return nil;
}

+ (NSString *)viewControllerStringFromURL:(NSURL *)url {
    NSArray *pathComponents = [url pathComponents];
    if ( pathComponents.count > 0 ) {
        return pathComponents[0];
    } else {
        return [url host];
    }
}

+ (NSDictionary *)queryParametersFromURL:(NSURL *)url {
    return [url queryComponents];
}

@end
