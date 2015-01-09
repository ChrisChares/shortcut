# shortcut

[![CI Status](http://img.shields.io/travis/Chris Chares/shortcut.svg?style=flat)](https://travis-ci.org/Chris Chares/shortcut)
[![Version](https://img.shields.io/cocoapods/v/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)
[![License](https://img.shields.io/cocoapods/l/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)
[![Platform](https://img.shields.io/cocoapods/p/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)

Shortcut is an attempt to bring URL-based routing to iOS in the least painful way possible. It allows you to instantiate and present view controllers via URL **without configuring routing** and from **outside the app (deep link)**

Let's look at some examples.  

    //create and present PropertyViewController using the default behavior
    openURL(@"PropertyViewController?id=wka92j9a8s);
    
    //open this URL from outside the app for the same behavior
    appScheme://PropertyViewController?id=wka92j9a8s
    
    //load the same view controller without presenting it
    UIViewController *vc = [Shortcut load:@"PropertyViewController?id=wka92j9a8s];
    
## How does it work?

By inspecting your bundle.  It searches for the named view controller in this order:

+ For a nib with matching name
+ In the main storyboard for a matching identifier
+ For a class with matching name

Once it has found your view controller it uses the standard iOS URL opening behavior.  In fact:

    openURL(url);
    //is really wrapping
    [UIApplication sharedApplication] openURL:url];
    //with a little convenience on top so that you don't have to include your app scheme
    //when calling local URLs


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

~~shortcut is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:~~
Not yet, but soon:

    pod "shortcut"

## Authors

+ the_meatloaf
+ chrischares

## License

shortcut is available under the MIT license. See the LICENSE file for more info.

