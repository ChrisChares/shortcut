//
//  SCTUtilities.m
//  Pods
//
//  Created by Chris Chares on 1/8/15.
//
//

#import "SCTUtilities.h"
#import "SCTDeviceMacros.h"
#import "XQueryComponents.h"

@implementation SCTUtilities


+ (BOOL)nibExists:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"nib"];
    return path != nil;
}

+ (BOOL)classExists:(NSString *)name {
    Class class = NSClassFromString(name);
    return class && [class isSubclassOfClass:[UIViewController class]];
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
        vc = [[SCTUtilities mainStoryBoard] instantiateViewControllerWithIdentifier:name];
    }
    @catch (NSException *exception) {
        vc =  nil;
    }
    @finally {
        return vc;
    }
    
}



@end
