//
//  Shortcut.m
//  Pods
//
//  Created by Chris Chares on 1/7/15.
//
//

#import "Shortcut.h"
#import "XQueryComponents.h"
#import "NSBundle+AppURLScheme.h"
#import "SCTUtilities.h"

@implementation Shortcut

static NSArray *greyList;
static NSArray *blackList;

static NSString *appURLScheme;

+ (void)initialize {
    if (self == [Shortcut class]) {
        appURLScheme = [[NSBundle mainBundle] appURLScheme];
        if ( ! appURLScheme ) {
            NSLog(@"Set up an app url scheme for this whole thing to work");
            abort();
        }
    }
}

+ (BOOL)handleOpenURL:(NSURL *)url navigationHandler:(ShortcutNavigationHandler)navHandler {
    NSString *viewControllerString = [[SCTUtilities viewControllerStringFromURL:url] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if ( [Shortcut passesBlackList:viewControllerString] ) {
        UIViewController *vc = [self load:url.absoluteString];
        navHandler(vc);
        return YES;
    } else {
        NSLog(@"Can't open ");
        return NO;
    }
}


+ (void)openStringURL:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    if ( url.scheme == nil ) {
        //it's a short hand url
        urlString = [NSString stringWithFormat:@"%@://%@", appURLScheme, [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        url = [[NSURL alloc] initWithString:urlString];
    }
    [[UIApplication sharedApplication] openURL:url];
}


+ (UIViewController *)load:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *vcString = [SCTUtilities viewControllerStringFromURL:url];
    NSDictionary *params = [SCTUtilities queryParametersFromURL:url];
    
    id viewController;
    
    //first check if a nib exists
    if ( [SCTUtilities nibExists:vcString] ) {
        Class class = NSClassFromString(vcString);
        if ( class == nil ) {
            class = NSClassFromString(@"UIViewController");
        }
        viewController = [[class alloc] initWithNibName:vcString bundle:nil];
    }
    else {
        //then check if it exists in storyboard
        viewController = [SCTUtilities viewControllerFromStoryBoardWithName:vcString];
        
        //finally check if class exists
        if( !viewController && [SCTUtilities classExists:vcString] ) {
            Class class = NSClassFromString(vcString);
            viewController = [[class alloc] init];
        }
    }
    
    if ( [viewController conformsToProtocol:@protocol(ShortcutParams)] ) {
        [viewController setShortcutParams:params];
    }
    return viewController;
}

+ (BOOL)passesBlackList:(NSString *)value {
    return ! [blackList containsObject:value];
}

+ (void)setBlackList:(NSArray *)list {
    blackList = list;
}

@end
