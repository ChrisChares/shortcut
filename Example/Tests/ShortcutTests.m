//
//  ShortcutTests.m
//  shortcut
//
//  Created by Chris Chares on 1/7/15.
//  Copyright (c) 2015 Chris Chares. All rights reserved.
//

#import <XCTest/XCTest.h>
#define EXP_Shorthand
#import <Expecta/Expecta.h>
#import "Shortcut.h"
#import "TestViewController1.h"
#import "InitialViewController.h"
#import "NSBundle+AppURLScheme.h"

@interface ShortcutTests : XCTestCase
@end

@implementation ShortcutTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [Shortcut setBlackList:nil];
    [super tearDown];
}

- (void)testLoad {
    expect([Shortcut load:@"FakeViewController?id=123"]).to.beNil();
    expect([Shortcut load:@"TestViewController1"]).toNot.beNil();
    expect([Shortcut load:@"testytaco123"]).toNot.beNil();
}

- (void)testBlackList {
    [Shortcut setBlackList:@[
                             @"PrivateViewController"
                             ]];
    expect([Shortcut passesBlackList:@"PrivateViewController"]).to.equal(NO);
}

@end
