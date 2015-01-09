//
//  UtilitiesTest.m
//  shortcut
//
//  Created by Chris Chares on 1/8/15.
//  Copyright (c) 2015 Chris Chares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#define EXP_Shorthand
#import <Expecta/Expecta.h>
#import "SCTUtilities.h"

@interface UtilitiesTest : XCTestCase

@end

@implementation UtilitiesTest

- (void)testVCStringFromURL {
    NSURL *url1 = [NSURL URLWithString:@"app://ViewController?hue=yes"];
    NSURL *url2 = [NSURL URLWithString:@"ViewController?hue=yes"];
    
    expect([SCTUtilities viewControllerStringFromURL:url1]).to.equal(@"ViewController");
    expect([SCTUtilities viewControllerStringFromURL:url2]).to.equal(@"ViewController");
    
}

- (void)testQueryParametersFromURL {
    NSURL *url = [NSURL URLWithString:@"ViewController?a=1&b=2&c=3"];
    NSDictionary *params = [SCTUtilities queryParametersFromURL:url];
    expect(params[@"a"]).to.equal(@"1");
    expect(params[@"b"]).to.equal(@"2");
    expect(params[@"c"]).to.equal(@"3");
}

- (void)testNibExists {
    expect([SCTUtilities nibExists:@"TestViewController1"]).to.beTruthy();
    expect([SCTUtilities nibExists:@"huehuehuehue"]).to.beFalsy();
}

- (void)testClassExists {
    expect([SCTUtilities classExists:@"TestViewController1"]).to.beTruthy();
    expect([SCTUtilities classExists:@"huehuehuehue"]).to.beFalsy();
    expect([SCTUtilities classExists:@"SCTAppDelegate"]).to.beFalsy();
}


- (void)testGetStoryboardVC {
    expect([SCTUtilities viewControllerFromStoryBoardWithName:@"testytaco123"]).toNot.beNil();
}

-(void)testGetStoryBoard {
    expect([SCTUtilities mainStoryBoard]).to.beTruthy();
}

@end
