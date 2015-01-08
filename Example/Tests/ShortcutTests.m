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

@interface ShortcutTests : XCTestCase

@end

@implementation ShortcutTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testVCStringFromURL {
    NSURL *url1 = [NSURL URLWithString:@"app://ViewController?hue=yes"];
    NSURL *url2 = [NSURL URLWithString:@"ViewController?hue=yes"];
    
    expect([Shortcut viewControllerStringFromURL:url1]).to.equal(@"ViewController");
    expect([Shortcut viewControllerStringFromURL:url2]).to.equal(@"ViewController");

}

- (void)testNibExists {
    expect([Shortcut nibExists:@"TestViewController1"]).to.beTruthy();
    expect([Shortcut nibExists:@"huehuehuehue"]).to.beFalsy();
}


- (void)testLoad {
    expect([Shortcut load:@"FakeViewController?id=123"]).to.beNil();
//    expect([Shortcut load:@"TestViewController1"]).toNot.beNil();
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
}

@end