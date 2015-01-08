//
//  TestViewController2.m
//  shortcut
//
//  Created by Chris Chares on 1/7/15.
//  Copyright (c) 2015 Chris Chares. All rights reserved.
//

#import "TestViewController1.h"

@interface TestViewController1 ()
{
    NSDictionary *inputParams;
}
@end

@implementation TestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textField setText:[inputParams description]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setShortcutParams:(NSDictionary *)params
{
    inputParams = params;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
