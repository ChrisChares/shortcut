//
//  BlackViewController.m
//  shortcut
//
//  Created by Chris Chares on 1/15/15.
//  Copyright (c) 2015 Chris Chares. All rights reserved.
//

#import "BlackViewController.h"

@interface BlackViewController ()

@end

@implementation BlackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blackColor;
    self.title = @"BlackViewController.h";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.text = @".h";
    label.font = [UIFont boldSystemFontOfSize:72];
    label.textAlignment = NSTextAlignmentCenter;
    label.center = self.view.center;
    label.textColor = UIColor.whiteColor;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
