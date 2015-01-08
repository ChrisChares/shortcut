//
//  AppURLSchemeTests.m
//  shortcut
//
//  Created by Chris Chares on 1/8/15.
//  Copyright (c) 2015 Chris Chares. All rights reserved.
//

#import <XCTest/XCTest.h>
#define EXP_Shorthand
#import <Expecta/Expecta.h>
#import "NSBundle+AppURLScheme.h"


@interface AppURLSchemeTests : XCTestCase

@end

@implementation AppURLSchemeTests

- (void)testURLScheme {
    expect([[NSBundle mainBundle] appURLScheme]).to.equal(@"shortcut");
}
@end
