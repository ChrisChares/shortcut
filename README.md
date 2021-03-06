# shortcut

[![CI Status](http://img.shields.io/travis/Chris Chares/shortcut.svg?style=flat)](https://travis-ci.org/Chris Chares/shortcut)
[![Version](https://img.shields.io/cocoapods/v/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)
[![License](https://img.shields.io/cocoapods/l/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)
[![Platform](https://img.shields.io/cocoapods/p/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)

Shortcut is an attempt to bring URL-based routing to iOS in the least obtrusive way possible. It allows you to instantiate and present view controllers via string URLs **without configuring routing** and from **outside the app (deep link)**

This is extremely insecure for production apps.  It is only intended for testing.

Let's look at some examples.  

    //Create and present PropertyViewController using the default behavior.
    //View controllers can adopt the ShortcutParams protocol to receive
    //query params as a NSDictionary
    openURL(@"PropertyViewController?id=wka92j9a8s);
    
    //Open this URL from outside the app for the same behavior
    appScheme://PropertyViewController?id=wka92j9a8s
    
    //Load the same view controller without presenting it.
    //These methods work with view controllers defined in .xib files and pure code as 
    //well as the the main storyboard for the current device type
    UIViewController *vc = [Shortcut load:@"PropertyViewController?id=wka92j9a8s];
    
## Getting Started

To run the example project, clone the repo, and run `pod install` from the Example directory first.

To use Shortcut in your own project, first install it via [CocoaPods](http://cocoapods.org)

    pod "shortcut"

Then add a custom URL scheme to your app plist. [It's not hard](http://www.idev101.com/code/Objective-C/custom_url_schemes.html)

Finally implement `handleOpenUrl:` in your App Delegate

    - (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [Shortcut handleOpenURL:url
                 navigationHandler:^(UIViewController *vc) {
                     //present the view controller in a manner appropriate for your app
                     [(UINavigationController *)self.window.rootViewController pushViewController:vc
                                                                                animated:YES];
                 }
            ];
    }
    
Now you can start using `openURL()` and `[Shortcut load:]`

If you have view controllers you would not like Shortcut to instantiate, create a blacklist

    [Shortcut setBlackList:@[@"PrivateViewController"]];

    
## How does it work?

By inspecting your bundle.  It searches for the named view controller in this order:

+ xib/nib names
+ main storyboard identifiers
+ class names

Once it has found your view controller it uses the standard iOS URL opening behavior.  In fact:

    openURL(url);
    //is really wrapping
    [UIApplication sharedApplication] openURL:url];
    //with a little convenience on top so that you don't have to include your app scheme
    //when calling local URLs


## Contributing

Some key needs:

+ Tests
+ Documentation
+ Caching (decision trees and storyboards?)
+ Less expensive way to check storyboard for identifier
+ Typed parameters ( NSNumber to start )
+ Black list pattern matching
+ Benchmarks

## Installation

~~shortcut is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:~~
Not yet, but soon:

    pod "shortcut"

## Authors

+ [themeatloaf](https://github.com/themeatloaf)
+ [chrischares](https://github.com/ChrisChares)

## License

shortcut is available under the MIT license. See the LICENSE file for more info.

