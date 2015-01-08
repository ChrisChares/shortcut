//
//  Shortcut.m
//  Pods
//
//  Created by Chris Chares on 1/7/15.
//
//

#import "Shortcut.h"
#import "XQueryComponents.h"
#import "DeviceMacros.h"

@implementation Shortcut

+ (void)openStringURL:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    if ( url.scheme == nil ) {
        
    }
}

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
    NSDictionary *params = [Shortcut queryParametersFromURL:url];
    
    id viewController;
    if ( [Shortcut nibExists:vcString] ) {
        viewController = [[UIViewController alloc] initWithNibName:vcString bundle:nil];
    }
    else {
        //do the storyboard check
        viewController = [Shortcut viewControllerFromStoryBoardWithName:vcString];

       if( !viewController && [Shortcut classExists:vcString] ) {
            Class class = NSClassFromString(vcString);
            viewController = [[class alloc] init];
        }
    }
    
    if ( [viewController conformsToProtocol:@protocol(ShortcutParams)] ) {
        [viewController setShortcutParams:params];
    }
    return viewController;
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

+ (UIStoryboard*)mainStoryBoard {
    
    NSString *bundleRoot = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/Base.lproj"];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:bundleRoot error:nil];
    NSString *match;
    if(IS_IPAD)
        match = @"*iPad.storyboardc";
    else
        match = @"*iPhone.storyboardc";
    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"SELF like[cd] %@",match];
    NSArray *onlyStoryBoard = [dirContents filteredArrayUsingPredicate:fltr];
    if (onlyStoryBoard.count==1) {
        NSString *name = [onlyStoryBoard firstObject];
        NSRange range= [name rangeOfString: @".storyboardc" options: NSBackwardsSearch];
        NSString *finalName= [name substringToIndex: range.location];
        return [UIStoryboard storyboardWithName:finalName bundle:[NSBundle mainBundle]];
    }
    return nil;
}

+ (UIViewController *)viewControllerFromStoryBoardWithName:(NSString*)name
{
    UIViewController *vc;
    @try {
        vc = [[Shortcut mainStoryBoard] instantiateViewControllerWithIdentifier:name];
    }
    @catch (NSException *exception) {
        vc =  nil;
    }
    @finally {
        return vc;
    }
    
}

@end
