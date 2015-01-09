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
    UIViewController *vc = [self load:url.absoluteString];
    navHandler(vc);
    return YES;
}


+ (void)openStringURL:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    if ( url.scheme == nil ) {
        urlString = [NSString stringWithFormat:@"%@://%@", appURLScheme, urlString];
        url = [NSURL URLWithString:urlString];
    }
    [[UIApplication sharedApplication] openURL:url];
}


+ (UIViewController *)load:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *vcString = [SCTUtilities viewControllerStringFromURL:url];
    NSDictionary *params = [SCTUtilities queryParametersFromURL:url];
    
    id viewController;
    if ( [SCTUtilities nibExists:vcString] ) {
        Class class = NSClassFromString(vcString);
        if ( class == nil ) {
            class = NSClassFromString(@"UIViewController");
        }
        viewController = [[class alloc] initWithNibName:vcString bundle:nil];
    }
    else {
        //do the storyboard check
        viewController = [SCTUtilities viewControllerFromStoryBoardWithName:vcString];
        
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


@end
