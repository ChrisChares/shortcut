# shortcut

[![CI Status](http://img.shields.io/travis/Chris Chares/shortcut.svg?style=flat)](https://travis-ci.org/Chris Chares/shortcut)
[![Version](https://img.shields.io/cocoapods/v/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)
[![License](https://img.shields.io/cocoapods/l/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)
[![Platform](https://img.shields.io/cocoapods/p/shortcut.svg?style=flat)](http://cocoadocs.org/docsets/shortcut)

Shortcut is an attempt to bring URL-based view controller routing to iOS in the least painful way possible. It allows you to instantiate and present view controllers via URL **without manually configuring routing** and from **outside the app (deep links)**

Let's look at some examples.  

    //create and present PropertyViewController using the default behavior (modal off root view controller)
    loadURL(@"PropertyViewController?id=wka92j9a8s);
    
    //load the same view controller without presenting it
    UIViewController *vc = [Shortcut load:@"PropertyViewController?id=wka92j9a8s];


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

